# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show edit update]
  before_action :find_test, only: %i[new create]

  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions
  end
  
  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_tests_url
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
