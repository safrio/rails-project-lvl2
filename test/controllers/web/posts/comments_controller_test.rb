# frozen_string_literal: true

require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post_comment = post_comments(:one)
  end

  test 'should not create comment' do
    assert_no_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: @post_comment.attributes }
    end

    assert_redirected_to new_user_session_url
  end

  test 'should create comment' do
    user = users(:one)
    sign_in(user)

    assert_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: @post_comment.attributes }
    end

    last_comm = PostComment.last
    assert_equal last_comm.content, @post_comment.content
    assert_equal last_comm.post, @post
    assert_equal last_comm.user, @post_comment.user
    assert_redirected_to @post
  end
end
