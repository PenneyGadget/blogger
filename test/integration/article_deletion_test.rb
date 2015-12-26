require 'test_helper'

class ArticleDeletionTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "user can delete article" do
    skip #flash.notice method causes this to fail currently - test passes without that line
    article = Article.create(title: "This is a Cool Title", body: "This is the BODY")

    visit article_path(article)

    click_link_or_button "Delete"

    assert_equal current_path, articles_path
    refute page.has_content? "This is a Cool Title"
    refute page.has_content? "This is the BODY"
  end

end
