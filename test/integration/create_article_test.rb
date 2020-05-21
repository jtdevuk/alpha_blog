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

  test "not signed in redirects to home page and displays error" do
    get new_article_path
    follow_redirect!
    assert_template 'home'
    assert_select 'div.alert'
  end

  test "incomplete new article form results in error" do
    sign_in_as(@user, @user.password)
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
      post articles_path, params: {article: {title: " ", description: " "}}
    end
  end

end
