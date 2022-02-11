# frozen_string_literal: true

module Web
  module Posts
    class CommentsController < ApplicationController
      def create
        @post = Post.find(params[:post_id])
        comment = @post.comments.new(comment_params.merge(user: current_user))

        notice = comment.save ? { notice: t('.success') } : { alert: comment.errors.full_messages.join(', ').capitalize }
        redirect_to @post, notice
      end

      private

      def comment_params
        params.require(:post_comment).permit(:content, :parent_id)
      end
    end
  end
end
