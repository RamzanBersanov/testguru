class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  private

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
