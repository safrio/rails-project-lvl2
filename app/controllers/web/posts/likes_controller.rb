# frozen_string_literal: true

module Web
  module Posts
    class LikesController < ApplicationController
      def create
        PostLike.create(like_params)

        redirect_to post_path(params[:post_id])
      end

      def destroy
        PostLike.find_by(like_params).delete

        redirect_to post_path(params[:post_id])
      end

      private

      def like_params
        { post_id: params[:post_id], user: current_user }
      end
    end
  end
end
