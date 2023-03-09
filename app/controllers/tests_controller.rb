# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  private

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
