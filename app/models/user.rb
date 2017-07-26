class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities 
  has_and_belongs_to_many :cohorts
  has_and_belongs_to_many :roles
  has_many :posts

  def gravitar_url
    user_hash = Digest::MD5.hexdigest(self.email)
    'http://gravatar.com/avatar/' + user_hash
  end 
end
