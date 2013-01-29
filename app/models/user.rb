class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates :email, uniqueness: true, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates_presence_of :encrypted_password

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  attr_accessible :email, :password

  index({ email: 1 }, { unique: true, name: "email_index" })

  has_and_belongs_to_many :owned_groups, class_name: "Group", inverse_of: :owners
  has_and_belongs_to_many :participating_groups, class_name: "Group", inverse_of: :participants

  def groups
    owned_groups.concat participating_groups
  end
end
