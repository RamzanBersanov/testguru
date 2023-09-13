class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, success: t('.success')
    else
      render :new
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to admin_badges_url, info: t('.deleted')
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :picture, :rule, :rule_value)
  end
end
