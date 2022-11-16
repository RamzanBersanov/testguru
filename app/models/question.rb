class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answer_number

  private
  def validate_answer_number
    if answers.present?
      unless answers.count.between?(1,4)
        errors.add(:answers, "Answers must be between 1 and 4")
      end
    end
  end
end
