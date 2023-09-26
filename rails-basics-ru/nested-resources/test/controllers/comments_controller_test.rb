require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do

    comment = post_comments(:one)
    post = posts(:one)
    post.post_comments.build(body: comment.body)
    post.save
    get edit_post_comment_url(post, comment)
    assert_response :success
  end

  test "should get destroy" do
    comment = post_comments(:one)
    post = posts(:one)
    delete post_comment_url(post, comment)

    assert { !PostComment.exists?(comment.id) }

    assert_redirected_to post_path(comment.post_id)
  end

  test "should get update" do
    comment = post_comments(:two)
    post = posts(:one)
    post.post_comments.build(body: comment.body)
    post.save
    @attrs = {
      body: Faker::ChuckNorris.fact
    }
    patch post_comment_path(post, comment), params: { post_comment: @attrs }
    assert_response :redirect
  end
end
