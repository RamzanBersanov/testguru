class User < ApplicationRecord
  def passed_tests(test_level)
    Test
      .joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where(tests_users: {user_id: id}, tests: {level: test_level})
  end
end
