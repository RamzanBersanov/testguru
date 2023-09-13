class Badge < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :picture, presence: true
  validates :rule, presence: true
end
