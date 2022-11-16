class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :level, :numericality => { only_integer: true, greater_than: 0 }, uniqueness: true

  scope :passed, -> (test_level) { where(level: test_level) }
  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :category_title, -> (category_title) { joins(:category)
                                                .where(categories: {title: category_title})
                                                .order(title: :desc)
                                                .pluck(:title) }

end
