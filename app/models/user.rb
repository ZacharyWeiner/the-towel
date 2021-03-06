class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  belongs_to :organization
  has_many :activities
  has_and_belongs_to_many :cohorts
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :side_trips
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :tags
  has_many :posts
  has_many :event_rsvps
  has_many :events, through: :event_rsvps
  has_many :photos
  has_many :announcements
  has_many :user_announcements
  has_many :notifications
  has_and_belongs_to_many :chat_rooms, dependent: :destroy
  has_and_belongs_to_many :housings
  has_many :messages, dependent: :destroy
  has_one :profile

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, organization_id:1).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def events_missing_ratings
    event_rsvps = EventRsvp.where(user: self)
    completed = []
    event_rsvps.each do |rsvp|
      if rsvp.event.date < DateTime.now
        notification = Notification.where(user: self).where(notification_type: "Event Rating Request").where(notification_obeject_id: rsvp.event.id).first
        if notification.nil?
          Notification.create!(user: self, notification_type: "Event Rating Request", notification_obeject_id: rsvp.event.id)
        end
      end
    end
  end

  def safe_name
    if self.profile.nil? || self.profile.display_name.nil?
      self.email
    else
      self.profile.display_name
    end
  end

  def new_messages
    @conversations = Conversation.where(sender_id: self.id).or(Conversation.where(recipient_id: self.id))
    @new_messages = []
    @conversations.each do |convo|
      last_msg = convo.emails.where.not(user_id: self.id).last
      unless last_msg.nil?
        if last_msg.read == false
          @new_messages << convo.emails.where.not(user_id: self.id).last
        end
      end
    end
    @new_messages
  end

  def new_announcements
    UserAnnouncement.where(user: self, read: false )
  end

  def new_notifications
    Notification.where(user: self, read: false)
  end

  def is_super_admin
    self.is_in_role(Role.super_admin)
  end

  def is_site_admin
    self.is_in_role(Role.site_admin)
  end

  def is_org_admin
    self.is_in_role(Role.org_admin)
  end

  def is_city_admin
    self.is_in_role(Role.city_admin)
  end

  def is_cohort_admin
    self.is_in_role(Role.cohort_admin)
  end

  def is_admin
    (self.is_in_role(Role.cohort_admin) || self.is_in_role(Role.city_admin) || self.is_in_role(Role.org_admin) ||self.is_in_role(Role.site_admin) || self.is_in_role(Role.super_admin))
  end

  def is_cohort_member
    self.is_in_role(Role.cohort_member)
  end

  def my_itinerary
    itinerary_items = []
    @cohort = self.current_cohort
    @cohort.transits.each { |t| itinerary_items << t.create_itinerary_item}
    self.side_trips.each{ |st| itinerary_items << st.create_itinerary_item}
    self.side_trips.each do | side_trip|
      side_trip.transits.each{ |t| itinerary_items << t.create_itinerary_item}
    end
    self.events.each{ |event| itinerary_items << event.create_itinerary_item}
    return  itinerary_items.sort {|x,y| x.date  <=> y.date}
  end

  def waitlisted_events(page)
    EventWaitlist.where(user: self).page(page)
  end

  def is_on_waitlist(event)
    EventWaitlist.where(event: event, user: self).count > 0
  end

  def rsvpd_for_event(event)
    EventRsvp.where(event: event, user:self).count > 0
  end

  def event_rsvp(event)
    EventRsvp.where(event: event, user:self).first
  end

  def requested_roomates
    @roomate_requests = RoomateRequest.where(requested_by: self)
  end

  def gravitar_url
    user_hash = Digest::MD5.hexdigest(self.email)
    'http://gravatar.com/avatar/' + user_hash
  end

  def current_cohort
    self.cohorts.last
  end

  def is_in_role(role_name)
    roles = self.roles.where(title: role_name)
    if roles.count > 0
      return true
    else
      return false
    end
  end

  def name
    email.split('@')[0]
  end

  def current_city

  end

  def current_cohort_city
    if self.current_cohort
      transits = self.current_cohort.schedule_items.where("arrival_date <= ?", Date.today).order("arrival_date DESC").limit(1)
      if transits.first.nil?
        "Somewhere"
      else
        transits.first.location.name
      end
    else
      "Globetrotting"
    end
  end

  def skills
    self.tags.where(tag_type: TagType.where(name: 'Skill'))
  end

  def interests
    self.tags.where(tag_type: TagType.where(name: 'Interest'))
  end

  def housing_preferences
    self.tags.where(tag_type: TagType.where(name: 'Housing'))
  end

  def clear_housing_tags
    @tags_to_destroy = self.tags.where(tag_type: TagType.where(name: 'Housing'))
    @tags_to_destroy.each do |tag|
      self.tags.destroy(tag)
    end
  end

  def clear_roomate_preferences
    @requests_to_destroy = RoomateRequest.where(requested_by: self)
    @requests_to_destroy.each do |request|
      request.destroy
    end
  end

  def clear_skills
    @tags_to_destroy = self.tags.where(tag_type: TagType.where(name: 'Skill'))
    @tags_to_destroy.each do |tag|
      self.tags.destroy(tag)
    end
  end

  def rank_for_housing(housing)
    rank = 0
    housing.tags.each do |t|
      if self.tags.include?(t)
        rank = rank + 1
      end
    end
    rank
  end

  def has_housing_in_location(location)
    self.housings.where(location: location).count > 0
  end
end
