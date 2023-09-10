# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level, message: 'can only be one test with such title and level' }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :passed, ->(test_level) { where(level: test_level) }
  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :category_title, lambda { |category_title|
                           joins(:category)
                             .where(categories: { title: category_title })
                             .order(title: :desc)
                         }

  def self.titles_by_category(category_title)
    category_title(category_title).pluck(:title)
  end
end
