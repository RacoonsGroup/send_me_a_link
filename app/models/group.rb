class Group
  include Mongoid::Document

  field :name
  field :slug
  field :description
  field :created_at, type: DateTime, default: Time.now
  field :not_approved_users, type: Array, default: []

  attr_accessible :name, :slug, :description,
                  :not_approved_users, :owners_attributes,
                  :participants_attributes

  validates :name, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true

  has_and_belongs_to_many :owners, class_name: "User", inverse_of: :owned_groups
  has_and_belongs_to_many :participants, class_name: "User", inverse_of: :groups

  accepts_nested_attributes_for :owners #, :participants

  index({ name: 1 }, { unique: true, name: "name_index" })
  index({ slug: 1 }, { unique: true, name: "slug_index" })

end
