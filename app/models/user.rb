class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  has_and_belongs_to_many :chat_rooms, dependent: :destroy
  has_and_belongs_to_many :housings
  has_many :messages, dependent: :destroy
  has_one :profile

  def new_messages
    @conversations = Conversation.where(sender_id: self.id).or(Conversation.where(recipient_id: self.id))
    @new_messages = []
    @conversations.each do |convo|
      last_msg = convo.mails.where.not(user_id: self.id).last
      unless last_msg.nil?
        if last_msg.read == false
          @new_messages << convo.mails.where.not(user_id: self.id).last
        end
      end
    end
    @new_messages
  end

  def new_announcements
    UserAnnouncement.where(user: current_user, read: false )
  end

  def is_site_admin
    self.is_in_role(Role.site_admin)
  end

  def is_city_admin
    self.is_in_role(Role.city_admin)
  end

  def is_cohort_admin
    self.is_in_role(Role.cohort_admin)
  end

  def is_admin
    (self.is_in_role(Role.cohort_admin) || self.is_in_role(Role.city_admin) || self.is_in_role(Role.site_admin))
  end

  def is_cohort_member
    self.is_in_role(Role.cohort_member)
  end

  def waitlisted_events
    EventWaitlist.where(user: self).map{|ew| ew.event}
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
    self.cohorts.where.not(id: 1).first
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
    transits = self.current_cohort.transits.where("date <= ?", Date.today).order("date DESC").limit(1)
  end

  def skills
    self.tags.where(tag_type: TagType.where(name: 'Skill'))
  end

  def interests
    self.tags.where(tag_type: TagType.where(name: 'Interest'))
  end

  def clear_housing_tags
    @tags_to_destroy = self.tags.where(tag_type: TagType.where(name: 'Housing'))
    @tags_to_destroy.each do |tag|
      self.tags.destroy(tag)
    end
  end

  def clear_roomate_preferences
    @requests_to_destroy = self.roomate_requests
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
