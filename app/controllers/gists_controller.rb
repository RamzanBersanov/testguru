class GistsController < ApplicationController
  before_action :set_test_passage, only: :create
  before_action :authenticate_user!

  def create
    @result = GistQuestionService.new(@test_passage.current_question).call

    @gist = current_user.gists.build(gist_url: @result['html_url'], question_id: @test_passage.current_question.id)

    if @gist.save
      flash_options = { notice: t('.success',
                                  link: view_context.link_to('gist', @result['html_url'].html_safe, target: '_blank',
                                                                                                    rel: 'nofollow', rel: 'nofollow')) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
