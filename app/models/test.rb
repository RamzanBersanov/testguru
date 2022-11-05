class Test < ApplicationRecord

  def self.by_category(category_title)
    category = Category.where(title: category_title).first
    where(category_id: category.id)
    # joins(:category).where(category: {title: category}).order(title: :desc)
  end

end
