require 'rails_helper'

RSpec.describe "Articles", type: :feature do

describe 'Articles' do

  background do
    @password = "814@gmail.com"
    @user = User.create(name: "000@gmail.com", email: "814@gmail.com", password: @password, password_confirmation: "814@gmail.com")
    
    ActionMailer::Base.deliveries.clear

    def extract_confirmation_url(mail)
      body = mail.body.encoded
      body[/http[^"]+/]
    end
    @article = Article.create(title: "111", body: "4")
    @article_second = Article.create(title: "691", body: "196")
   end
   
   #viewのテスト
  context "検索する" do
    it "タイトルで検索できる" do
      click_link "記事一覧"
      save_and_open_page    
      fill_in "article_title", with: @article.title
      click_button "検索する"
      expect(page).to have_content @article.title
    end
  end
end
end



