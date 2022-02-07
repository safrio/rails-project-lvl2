# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    cookies[:locale] = locale

    I18n.with_locale(locale, &action)
  end
end
