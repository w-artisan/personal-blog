class Comment < ApplicationRecord
  include Discard::Model

  # validates_presence_of :content
  validates :content, presence: true

  belongs_to :blog
  belongs_to :user

  def self.by_created_at
    order("created_at DESC")
  end
end
