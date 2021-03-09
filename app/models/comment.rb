class Comment < ApplicationRecord
  # validates_presence_of :content
  validates :content, presence: true

  belongs_to :blog
  belongs_to :user
end
