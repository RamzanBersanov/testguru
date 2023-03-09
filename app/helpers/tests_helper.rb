# frozen_string_literal: true

module TestsHelper
  def test_level(test)
    if Test.easy.include?(test)
      :easy
    elsif Test.intermediate.include?(test)
      :intermediate
    elsif Test.difficult.include?(test)
      :difficult
    else
      :hero
    end
  end
end
