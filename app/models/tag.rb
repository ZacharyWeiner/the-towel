class Tag < ApplicationRecord
  belongs_to :tag_type
  has_and_belongs_to_many :housings
  has_and_belongs_to_many :events
  has_and_belongs_to_many :users
  has_and_belongs_to_many :side_trips
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :locations
   has_many :children, :class_name => "Tag", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Tag", :foreign_key => "parent_id", optional: true

  def self.skills
    Tag.where(tag_type: TagType.where(name:'Skill').first)
  end

  def self.interests
    Tag.where(tag_type: TagType.where(name:'Interest').first)
  end

  def self.event_tags
    Tag.where(tag_type: TagType.where(name:'Event').first)
  end

  def self.housing_tags
    Tag.where(tag_type: TagType.where(name:'Housing').first)
  end

  def self.side_trip_tags
    Tag.where(tag_type: TagType.where(name:'Side Trip').first)
  end

  def self.location_tags
    Tag.where(tag_type: TagType.where(name:'Location').first)
  end

  def self.photo_tags
    Tag.where(tag_type: TagType.where(name:'Photo').first)
  end
end
