# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :info, :danger, :warning, :success, :messages

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      super
    end
  end

  def default_url_options
    { lang: (I18n.locale unless I18n.locale == I18n.default_locale) }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
