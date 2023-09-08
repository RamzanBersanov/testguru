class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to admin_badges_url, info: t('.deleted')
  end
end
