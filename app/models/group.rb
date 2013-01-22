class Group
  include Mongoid::Document

  field :name
  field :slug
  field :password_salt
  field :password_hash
  field :description
  field :created_at, type: DateTime, default: Time.now

  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  #has_many :articles
  has_and_belongs_to_many :users

  validates_presence_of :owner_id
  validates_presence_of :name
  validates_presence_of :slug
  validate :check_password


  def self.authenticate(slug, password)
    user = Group.where(slug: slug).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present? && password_confirmation.present? && password == password_confirmation
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def check_password
    if self.password.blank?
      errors.add(:base, "Password can't be blank")
    end
    if self.password != self.password_confirmation
      errors.add(:base, "Password and confirmation does not match")
    end
  end

end
