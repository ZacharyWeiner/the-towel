class Role < ApplicationRecord
  has_and_belongs_to_many :users
  @@SUPER_ADMIN = 'super_admin'
  @@SITE_ADMIN = 'site_admin'
  @@ORG_ADMIN = 'organization_admin'
  @@CITY_ADMIN = 'city_admin'
  @@COHORT_ADMIN = 'cohort_admin'
  @@COHORT_MEMBER = 'cohort_member'

  def self.super_admin
    'super_admin'
  end

  def self.site_admin
    'site_admin'
  end

  def self.org_admin
    'organization_admin'
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
