class Housing < ApplicationRecord
  belongs_to :location
  has_many :photos
  has_and_belongs_to_many :tags
end
