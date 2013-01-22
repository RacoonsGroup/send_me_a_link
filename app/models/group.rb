class Group
  include Mongoid::Document

  field :name
  field :slug
  field :approved_emails,     :type => Array
  field :not_approved_emails, :type => Array

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug
end
