# frozen_string_literal: true

module Web
  module Posts
    class LikesController < ApplicationController
      before_action :like_by_params

      def create
        PostLike.create(like_params) if like_by_params.blank?

        redirect_to post_path(params[:post_id])
      end

      def destroy
        if like_by_params.present?
          # rubocop:disable Rails::SkipsModelValidations
          Post.decrement_counter(:likes_count, params[:post_id])
          # rubocop:enable Rails::SkipsModelValidations
          like_by_params&.delete
        end

        redirect_to post_path(params[:post_id])
      end

      private

      def like_by_params
        @like_by_params ||= PostLike.find_by(like_params)
      end

      def like_params
        { post_id: params[:post_id], user: current_user }
      end
    end
  end
end
