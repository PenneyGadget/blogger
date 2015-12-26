require 'test_helper'

class ArticleCreationTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can create an article" do
    #if authentification is done:
    #User.new username: "Penney", password: "dkfjdlfj", etc.

    visit new_article_path

    fill_in "article[title]", with: "Cats"
    fill_in "article[body]", with: "They are so cute."
    click_link_or_button "Create Article"

    assert page.has_content? "Cats"
    assert page.has_content? "They are so cute."

    assert_equal current_path, article_path(Article.last)
  end

end
