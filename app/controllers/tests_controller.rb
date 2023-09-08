# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @test.end_time = @test.countdown.minutes.since 
    @test.save
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end
