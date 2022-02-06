require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should redirect to login page' do
    user = users(:one)
    sign_out user
    assert_no_difference 'PostLike.count' do
      post post_likes_url(@post)
    end
    assert_redirected_to new_user_session_url
  end

  test 'should toggle like' do
    user = users(:one)
    sign_in(user)

    assert_difference 'PostLike.count', 1 do
      post post_likes_url(@post)
    end

    post_like = PostLike.last

    assert_difference 'PostLike.count', -1 do
      delete post_like_url(@post, post_like)
    end

    assert_redirected_to @post
  end
end
