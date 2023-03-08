class Admin::AnswersController < Admin::BaseController
    
    before_action :find_question, only: %i[index edit new create update destroy show edit]
    before_action :find_test, only: %i[index edit new update destroy show create]
    before_action :find_answer, only: %i[edit update destroy show]
  
    def index 
      @answers = @question.answers
    end 
  
    def edit;end
  
    def update
      @question = @answer.question
      if @answer.update(answer_params)
        redirect_to admin_test_question_answer_path
      else
        render :edit
      end
    end

    def show
      @question = @answer.question
    end

    def new
      @answer = @question.answers.build
    end
  
    def create
      answer = @question.answers.build(answer_params)
      if answer.save
        redirect_to admin_test_question_answer_path(@test, @question, answer)
      else
        render :new
      end
    end
  
    def destroy
      @answer.destroy
      redirect_to admin_test_question_answers_url
    end
  
    private
  
    def find_test
      @test = Test.find(params[:test_id])
    end
  
    def find_question
      @question = Question.find(params[:question_id])
    end
  
    def answer_params
      params.require(:answer).permit(:body)
    end

    def find_answer
      @answer = Answer.find(params[:id])
    end
  end
  