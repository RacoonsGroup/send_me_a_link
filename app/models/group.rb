class Group
  include Mongoid::Document

  field :name
  field :login
  field :approved_emails,     :type => Array
  field :not_approved_emails, :type => Array

  validates_presence_of :name, :login
  validates_uniqueness_of :name, :login
end
