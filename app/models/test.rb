class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  has_many :questions, dependent: :destroy

  def self.by_category(category_title)
    joins(:category)
      .where(categories: {title: category_title})
      .order(title: :desc)
      .pluck(:title)
  end
end
