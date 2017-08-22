class Housing < ApplicationRecord
  belongs_to :location
  has_many :photos
end
