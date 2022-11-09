class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  def self.by_category(category_title)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: {title: category_title})
      .order(title: :desc)
      .pluck(:title)
  end
end
