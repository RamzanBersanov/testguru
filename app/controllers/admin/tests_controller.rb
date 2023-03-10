# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.tests.where(author_id: current_user.id).build(test_params)

    if @test.save
      redirect_to admin_test_url(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_url(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to action: 'index'
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
