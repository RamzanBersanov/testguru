class CreateBadgeService
  # before_action :authenticate_user!

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    test = @test_passage.test
    user = @test_passage.user
    user.successful_tests << test if @test_passage.successful?
    badge_for_level(user, test)
    badge_for_category(user, test)
  end

  def badge_for_level(user, test)
    case test.level
    when 1
      user.badges.build(title: 'easy', picture: 'third.jpg').save if user.successful_tests.easy.distinct == Test.easy
    when 2..4
      if user.successful_tests.intermediate.distinct == Test.intermediate
        user.badges.build(title: 'intermediate',
                          picture: 'second.jpg').save
      end
    when 5..Float::INFINITY
      if user.successful_tests.difficult.distinct == Test.difficult
        user.badges.build(title: 'difficult',
                          picture: 'first.jpg').save
      end
    end
  end

  def badge_for_category(user, test)
    return unless user.successful_tests.category_title(test.category).distinct == Test.category_title(test.category)

    case test.category
    when 'Академические'
      user.badges.build(title: test.category.title, picture: 'academic.png').save
    when 'Логические'
      user.badges.build(title: test.category.title, picture: 'logic.png').save
    end
  end
end
