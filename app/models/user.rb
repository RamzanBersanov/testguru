class User < ApplicationRecord
  has_many :tests, inverse_of: 'author'
  has_many :tests_users
  has_many :tests, through: :tests_users
  def passed_tests(test_level)
    Test
      .joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where(tests_users: {user_id: id}, tests: {level: test_level})
  end
end
