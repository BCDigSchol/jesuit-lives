class User < ApplicationRecord
  belongs_to :role

  has_many :editedby_staticpage, class_name: 'Staticpage', foreign_key: 'editedby_id'
  has_many :createdby_staticpage, class_name: 'Staticpage', foreign_key: 'createdby_id'

  USER_ROLES = {admin: 1, supervisor: 2, editor: 3}.freeze
  enum roles: USER_ROLES

  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end

  def admin?
    self.is_role? "admin"
  end

  def is_role? (role_given)
    self.role && self.role.name == role_given
  end
end
