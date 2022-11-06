class Test < ApplicationRecord
  def self.by_category(category_title)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: {title: category_title})
      .order(title: :desc)
  end
end
