# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
