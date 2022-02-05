# frozen_string_literal: true

module Web
  module Posts
    class CommentsController < ApplicationController
      def create
        @post = Post.find(params[:post_id])
        comment = PostComment.new(comment_params.merge(creator: current_user,
                                                       post: @post,
                                                       parent_id: comment_params[:parent_id]))

        redirect_to @post, comment.save ? { notice: t('.success') } : { alert: t('.error') }
      end

      private

      def comment_params
        params.require(:post_comment).permit(:content, :parent_id)
      end
    end
  end
end
