require 'test_helper'

class ArticleEditTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can edit an article" do
    article = Article.create(title: "This is a Cool Title", body: "This is the BODY")

    visit article_path(article)

    click_link_or_button "Edit"
    assert_equal current_path, edit_article_path(article)

    fill_in "article[title]", with: "An Even Better Title!"
    fill_in "article[body]", with: "Bigger Better BODY"
    click_link_or_button "Update Article"

    assert_equal current_path, article_path(article)
    assert page.has_content? "An Even Better Title"
    assert page.has_content? "Bigger Better BODY"
  end

end
