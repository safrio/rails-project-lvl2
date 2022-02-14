# frozen_string_literal: true

require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post_comment_attrs = {
      content: Faker::Lorem.sentence,
      post: @post
    }
  end

  test 'should not create comment' do
    post post_comments_url(@post), params: { post_comment: @post_comment_attrs }

    assert { !PostComment.find_by(@post_comment_attrs) }
    assert_redirected_to new_user_session_url
  end

  test 'should create comment' do
    user = users(:one)
    sign_in(user)

    post post_comments_url(@post), params: { post_comment: @post_comment_attrs }

    assert { PostComment.find_by! @post_comment_attrs }
    assert_redirected_to @post
  end
end
