module Badges
  class LevelsRuleSpecification < AbstractRuleSpecification
    def satisfies?
      return unless @test_passage.test.level == @value.to_i

      all_tests_in_level = Test.where(level: @value.to_i).ids
      @user_successful_tests.where(id: all_tests_in_level).ids.count == all_tests_in_level.count
    end
  end
end
