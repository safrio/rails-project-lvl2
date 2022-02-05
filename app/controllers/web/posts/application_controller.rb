# frozen_string_literal: true

module Web
  module Posts
    class ApplicationController < ::ApplicationController
      before_action :authenticate_user!
    end
  end
end
