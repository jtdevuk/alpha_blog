require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "John", email: "john@john.com", password: "123")
  end

  test "create new article" do
    sign_in_as(@user, @user.password)
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title: "This is a new article", description: "Description of new article"}}
      follow_redirect!
    end
  end

end
