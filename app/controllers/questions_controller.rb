class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    @test_id = params[:test_id]
    @questions = Question.where(test_id: @test_id)
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def new
    @question = @test.questions.build
    render :new
  end

  def create
    question = @test.questions.build(question_params)
    respond_to do |format|
      if question.save
        format.html { redirect_to test_questions_path(@test) }
        format.text { render plain: question.inspect }
      else
        format.html { render :new }
        format.text { render plain: 'Попробуйте снова' }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to test_questions_path(@test), status: :see_other }
      format.text { render plain: 'Вопрос удален' }
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
