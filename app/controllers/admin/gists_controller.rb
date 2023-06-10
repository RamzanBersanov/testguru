class Admin::GistsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @gists = Gist.all
  end

  def new
    @gist = Gist.new
  end

  def create
    @gist = Gist.create(gist_params_to_save)
  end

  private

  def gist_params_to_save
    params.require(:gist).permit(:creator_email, :question_body, :gist_url)
  end
end
