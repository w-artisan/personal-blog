class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true
end
