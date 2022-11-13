class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def passed_tests(test_level)
    tests.where(level: test_level).pluck("title")
  end
end
