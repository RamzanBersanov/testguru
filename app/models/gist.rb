class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :creator_email, presence: true
  validates :question_body, presence: true, length: { maximum: 25 }
  validates :gist_url, presence: true
end
