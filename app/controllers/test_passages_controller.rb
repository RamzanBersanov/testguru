# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    @result = GistQuestionService.new(@test_passage.current_question).call

    @gist = Gist.new(gist_url: @result['html_url'])
    @gist.user = current_user
    @gist.question = @test_passage.current_question
    @gist.save

    if @result.nil?
      flash_options = { alert: t('.failure') }
    else
      flash_options = { notice: t('.success',
                                  link: view_context.link_to('gist', @result['html_url'].html_safe, target: '_blank',
                                                                                                    rel: 'nofollow', rel: 'nofollow')) }
    end

    redirect_to @test_passage, flash_options
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
