class ChatRoom < ApplicationRecord
  belongs_to :owner, :class_name => :User, :foreign_key => "user_id", optional: true
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :cohorts
  has_and_belongs_to_many :users
end
