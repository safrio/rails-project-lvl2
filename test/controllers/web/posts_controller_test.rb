# frozen_string_literal: true

require 'test_helper'

class Web::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get redirect to login' do
    get new_post_url
    assert_redirected_to new_user_session_url
  end

  test 'should get new' do
    user = users(:one)
    sign_in(user)

    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    user = users(:one)
    sign_in(user)

    assert_difference('Post.count') do
      post posts_url, params: { post: @post.attributes }
    end

    assert { Post.find_by! @post.attributes }

    assert_redirected_to root_url
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
