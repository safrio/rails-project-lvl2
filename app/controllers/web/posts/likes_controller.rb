module Web
  module Posts
    class LikesController < ApplicationController
      def create
        like = PostLike.find_or_create_by(post_id: params[:post_id])
        like.increment(:count).save!

        redirect_to like.post
      end
    end
  end
end
