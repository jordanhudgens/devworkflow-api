class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :name

  has_many :projects, dependent: :destroy
  has_many :check_list_items, dependent: :destroy
end
