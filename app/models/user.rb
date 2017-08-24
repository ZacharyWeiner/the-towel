class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  has_and_belongs_to_many :chat_rooms
  has_and_belongs_to_many :housings
  has_many :messages, dependent: :destroy


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

  def rank_for_housing(housing)
    rank = 0
    housing.tags.each do |t|
      if self.tags.include?(t)
        rank = rank + 1
      end
    end
    rank
  end
end
