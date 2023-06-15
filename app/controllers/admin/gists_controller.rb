class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def create
    @gist = Gist.new(gist_params)
  end

  private

  def gist_params
    params.require(:gist).permit(:gist_url)
  end
end
