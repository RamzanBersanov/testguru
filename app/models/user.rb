class User < ApplicationRecord
  has_and_belongs_to_many :test

  def passed_tests(level)
    test.where(level: level)
  end
end
