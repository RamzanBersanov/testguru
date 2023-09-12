# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :set_current_question, on: %i[create update]

  def completed?
    current_question.nil? || timer <= 0
  end

  def question_number
    self.test.questions.index(current_question) + 1
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_percentage
    (self.correct_questions * 100) / self.test.questions.count
  end

  def successful?
    correct_percentage >= SUCCESS_RATIO
  end

  def end_time
    created_at + self.test.countdown.minutes
  end

  def timer
    end_time - Time.current
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
