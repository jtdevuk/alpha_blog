require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports")
    @user = User.create(username: "John", email: "john@john.com", password: "123456", admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, @user.password)
    get new_category_url
    assert_response :success
  end

  # test "should create category" do
  #   assert_difference('Category.count') do
  #     post categories_url, params: { category: {  } }
  #   end
  #
  #   assert_redirected_to category_url(Category.last)
  # end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: "sports"}}
    end
    assert_redirected_to categories_path
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end
  #
  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end
  #
  #   assert_redirected_to categories_url
  # end
end
