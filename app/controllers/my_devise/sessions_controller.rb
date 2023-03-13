class MyDevise::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Привет, #{resource.name}"
  end
end
