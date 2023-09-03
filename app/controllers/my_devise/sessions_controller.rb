# frozen_string_literal: true

module MyDevise
  class SessionsController < Devise::SessionsController
    def create
      super
      flash[:notice] = "Привет, #{resource.name}"
    end
  end
end
