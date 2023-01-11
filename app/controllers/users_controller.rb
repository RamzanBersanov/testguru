class UsersController < ApplicationController
  def new
    session.destroy
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user&.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      flash[:alert] = 'Вы хотите стать Гуру? Заполните все поля, пожалуйста'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
