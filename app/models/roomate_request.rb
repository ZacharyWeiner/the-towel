class RoomateRequest < ApplicationRecord
  belongs_to :requester, :class_name => :User, :foreign_key => "requested_by"
  belongs_to :requested_roomate, :class_name => :User, :foreign_key => "requested"
end
