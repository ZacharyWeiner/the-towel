class Role < ApplicationRecord
  has_and_belongs_to_many :users

  @@SITE_ADMIN = 'site_admin'
  @@CITY_ADMIN = 'city_admin'
  @@COHORT_ADMIN = 'cohort_admin'
  @@COHORT_MEMBER = 'cohort_member'

  def self.site_admin
    'site_admin'
  end

  def self.city_admin
    'city_admin'
  end

  def self.cohort_admin
    'cohort_admin'
  end

  def self.cohort_member
    'cohort_member'
  end

end
