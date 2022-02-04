require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post_comment = post_comments(:one)

    user = users(:one)
    sign_in(user)
  end

  test 'should create comment' do
    assert_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: @post_comment.attributes }
    end

    assert_redirected_to @post
  end
end
