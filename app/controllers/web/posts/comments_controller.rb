# frozen_string_literal: true

module Web
  module Posts
    class CommentsController < ApplicationController
      def create
        @post = Post.find(params[:post_id])
        comment = PostComment.new(comment_params.merge(user: current_user,
                                                       post: @post,
                                                       parent_id: comment_params[:parent_id]))

        notice = comment.save ? { notice: t('.success') } : { alert: t('.error', msg: comment.errors.first.full_message) }
        redirect_to @post, notice
      end

      private

      def comment_params
        params.require(:post_comment).permit(:content, :parent_id)
      end
    end
  end
end
