module Web
  module Posts
    class CommentsController < ApplicationController
      def create
        @post = Post.find(params[:post_id])
        @comment = PostComment.new(comment_params.merge(post: @post))

        if @comment.save
          redirect_to @post, notice: t('.success')
        else
          redirect_to @post, error: t('.error')
        end
      end

      private

      def comment_params
        params.require(:post_comment).permit(:content)
      end
    end
  end
end
