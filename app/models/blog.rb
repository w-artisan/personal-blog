class Blog < ApplicationRecord
  extend FriendlyId
  include Discard::Model

 friendly_id :title, use: :slugged
  # validates_presence_of :title, :body
  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
end
