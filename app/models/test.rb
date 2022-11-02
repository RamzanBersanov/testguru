class Test < ApplicationRecord
  belongs_to :author,class_name: 'User'
  belongs_to :category
  has_and_belongs_to_many :user

  def self.by_category(category)
    joins(:category).where(category: {title: category}).order(title: :desc)
  end

end
