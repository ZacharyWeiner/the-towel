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
end
