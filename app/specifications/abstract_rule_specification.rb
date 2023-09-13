class AbstractRuleSpecification
  def initialize(value:, test_passage:)
    @value = value 
    @test_passage = test_passage
    @user_successful_tests = @test_passage.user.tests.joins(:test_passages).merge(TestPassage.successful).distinct
  end 

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end 
end 
