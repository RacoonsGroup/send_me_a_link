class Group
  include Mongoid::Document

  field :name
  field :slug
  field :description
  field :created_at, type: DateTime, default: Time.now
  field :owner_id

  attr_accessible :name, :slug, :description

  validates :name, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true

  has_and_belongs_to_many :users

  index({ name: 1 }, { unique: true, name: "name_index" })
  index({ slug: 1 }, { unique: true, name: "slug_index" })

  def owner
    User.find(owner_id)
  end

  def owner?(user)
    owner_id == user.id
  end

  # attr_accessor :password, :password_confirmation
  # before_save :encrypt_password

  #has_many :articles
  # has_and_belongs_to_many :users

  # validates_presence_of :owner_id
  # validates_presence_of :name
  # validates_presence_of :slug
  # validate :check_password


  # def self.authenticate(slug, password)
  #   user = Group.where(slug: slug).first
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user
  #   else
  #     nil
  #   end
  # end

  # def encrypt_password
  #   if password.present? && password_confirmation.present? && password == password_confirmation
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end

  # def check_password
  #   if self.password.blank?
  #     errors.add(:base, "Password can't be blank")
  #   end
  #   if self.password != self.password_confirmation
  #     errors.add(:base, "Password and confirmation does not match")
  #   end
  # end

end
