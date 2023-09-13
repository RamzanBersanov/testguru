module Badges
  class FirstTryRuleSpecification < AbstractRuleSpecification
    def satisfies?
      @test_passage.user.test_passages.where(test_id: @test_passage.test.id).successful.count == 1
    end
  end
end
