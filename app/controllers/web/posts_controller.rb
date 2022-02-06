# frozen_string_literal: true

module Web
  class PostsController < ApplicationController
    before_action :authenticate_user!, only: %w[new create]

    def index
      @posts = Post.includes(:creator, :likes).order(id: :desc)
    end

    def new
      @post = Post.new
    end

    def show
      @new_comment = PostComment.new
      @comments = PostComment.includes(:user).where(post_id: params[:id]).arrange
      @post = Post.includes(:creator).find(params[:id])
    end

    def create
      @post = Post.new(post_params.merge(creator: current_user))

      if @post.save
        redirect_to root_url, notice: t('.success')
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :post_category_id)
    end
  end
end
