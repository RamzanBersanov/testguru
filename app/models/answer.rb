# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answer_number

  scope :correct, -> { where(correct: true) }

  private

  def validate_answer_number
    return if question.answers.count < 5

    errors.add(:question, 'Number of answers must be between 1 and 4')
  end
end
