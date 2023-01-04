class SessionsController < ApplicationController
    def new;end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        if cookies[:users_initial_request] != nil 
          redirect_to cookies[:users_initial_request] 
        else 
          redirect_to tests_path 
        end 
        cookies.delete(:users_initial_request)
      else
        flash[:alert] = 'Вы Гуру? Подтвердите свой e-mail и пароль, пожалуйста'
        render :new
      end
    end
  
    def destroy
      session.destroy
      redirect_to tests_path
    end
  
  end
  