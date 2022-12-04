class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit update destroy show edit]
  before_action :find_test, only: %i[index new create]
  before_action :find_test_without_test_id, only: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      render :show
    else
      render :edit
    end
  end

  def new
    @question = @test.questions.build
  end

  def create
    question = @test.questions.build(question_params)
    if question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_test_without_test_id
    @test = @question.test
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
