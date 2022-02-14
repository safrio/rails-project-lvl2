# frozen_string_literal: true

require 'test_helper'

class Web::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_attrs = {
      title: Faker::Job.title,
      body: Faker::Lorem.paragraph_by_chars(number: 150),
      post_category_id: post_categories(:one).id
    }
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

    post posts_url, params: { post: @post_attrs }

    assert { Post.find_by! @post_attrs.merge(creator: user) }
    assert_redirected_to root_url
  end

  test 'should show post' do
    get post_url(posts(:one))
    assert_response :success
  end
end
