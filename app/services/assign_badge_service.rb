class AssignBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
    @badges = Badge.all
    @user_successful_tests = @user.tests.joins(:test_passages).merge(TestPassage.successful).distinct
  end

  def call
    @badges.each do |badge|
      @test_passage.user.badges << badge if send "#{badge.rule}", badge.given_for
    end
  end

  def category?(category)
    return unless @test.category.title == category

    all_tests_in_category = Test.category_title(category).ids
    @user_successful_tests.where(id: all_tests_in_category).ids.count == all_tests_in_category.count
  end

  def level?(level)
    return unless @test.level == level.to_i

    all_tests_in_level = Test.where(level: level.to_i).ids
    @user_successful_tests.where(id: all_tests_in_level).ids.count == all_tests_in_level.count
  end

  def successful_first_try?(_successful_first_try)
    @user.test_passages.where(test_id: @test.id).successful.count == 1
  end
end
