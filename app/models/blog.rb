class Blog < ApplicationRecord
  # validates_presence_of :title, :body
  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy
end
