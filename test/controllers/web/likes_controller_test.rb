require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should not add like' do
    assert_no_difference '@post.like.count' do
      post post_likes_url(@post)
      @post.reload
    end
    assert_redirected_to new_user_session_url
  end

  test 'should add like' do
    user = users(:one)
    sign_in(user)

    assert_difference '@post.like.count' do
      post post_likes_url(@post)
      @post.reload
    end
    assert_redirected_to @post
  end
end
