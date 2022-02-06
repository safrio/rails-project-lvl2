# frozen_string_literal: true

module Web
  module Posts
    class LikesController < ApplicationController
      before_action :post_by_params

      def create
        PostLike.create(like_params) if post_by_params.blank?

        redirect_to post_path(params[:post_id])
      end

      def destroy
        post_by_params&.delete

        redirect_to post_path(params[:post_id])
      end

      private

      def post_by_params
        PostLike.find_by(like_params)
      end

      def like_params
        { post_id: params[:post_id], user: current_user }
      end
    end
  end
end
