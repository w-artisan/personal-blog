class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include Discard::Model
  # validates_presence_of :title, :body
  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  after_discard do
    comments.discard_all
  end

  after_undiscard do
    comments.undiscard_all
  end
end
