class User < ApplicationRecord
  include Discard::Model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true

  belongs_to :deleted_by, class_name: "User", optional: true

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Virtual Attributes
  def first_name
    # self.name.split.first
    name.split.first
  end

  def last_name
    # self.name.split.last
    name.split.last
  end

  after_discard do
    blogs.discard_all
    comments.discard_all
  end

  after_undiscard do
    blogs.undiscard_all
    comments.undiscard_all
  end
end
