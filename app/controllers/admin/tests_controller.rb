# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.tests.where(author_id: current_user.id).build(test_params)

    if @test.save
      redirect_to [:admin, @test], success: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], success: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_url, info: t('.deleted')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
