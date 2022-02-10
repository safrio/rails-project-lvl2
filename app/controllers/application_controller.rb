# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :switch_locale # why instead of around_action: https://github.com/heartcombo/devise/issues/5247#issuecomment-659655504

  def switch_locale
    I18n.locale = cookies[:locale] = params[:locale] || cookies[:locale] || I18n.default_locale
  end
end
