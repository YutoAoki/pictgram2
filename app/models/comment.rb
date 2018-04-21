class Comment < ApplicationRecord
  # validates :topic_id, presence: true
  validates :comment_text, presence: true

  belongs_to :topic
end


  #validates :image, presence: true
