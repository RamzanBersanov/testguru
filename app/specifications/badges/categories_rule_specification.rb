module Badges
  class CategoriesRuleSpecification < AbstractRuleSpecification
    def satisfies?
      return unless @test_passage.test.category_id == @value.to_i
 
      all_tests_in_category = Test.where(category: @value.to_i).ids
      @user_successful_tests.where(id: all_tests_in_category).ids.count == all_tests_in_category.count 
    end 
  end 
end 
