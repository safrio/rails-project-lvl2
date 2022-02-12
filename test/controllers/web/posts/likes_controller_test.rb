# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should redirect to login page' do
    user = users(:one)
    sign_out user

    post post_likes_url(@post)

    assert { !PostLike.find_by(post: @post, user: user) }
    assert_redirected_to new_user_session_url
  end

  test 'should toggle like' do
    user = users(:one)
    sign_in(user)

    post post_likes_url(@post)
    assert { PostLike.find_by!(post: @post, user: user) }

    post_like = PostLike.find_by(post: @post, user: user)

    delete post_like_url(@post, post_like)

    assert { !PostLike.find_by(post: @post, user: user) }
    assert_redirected_to @post
  end
end
