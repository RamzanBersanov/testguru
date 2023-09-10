class AssignBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
    @user_successful_tests = @user.tests.joins(:test_passages).merge(TestPassage.successful)
  end

  def call
    rules = [for_level, for_category]
    return if rules.nil?

    @user.badges << [Badge.where(title: rules[0]), Badge.where(title: rules[1])]
  end

  private

  def for_level
    if @user_successful_tests.where(level: @test.level).distinct.order(:id).ids ==
       Test.where(level: @test.level).order(:id).ids
      badge_type = @test.level
    end
  end

  def for_category
    if @user_successful_tests.where(category_id: @test.category_id).distinct.order(:id).ids ==
       Test.where(category_id: @test.category_id).order(:id).ids
      badge_type = @test.category.title
    end
  end
end
