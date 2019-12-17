require 'rails_helper'

RSpec.feature "Articles", type: :feature do

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

    
      visit new_user_registration_path
      expect(page).to have_http_status :ok
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'password', with: 'foo@example.com'
      fill_in 'password_confirmation', with: 'foo@example.com'
      click_button '新規登録'
      expect(page).to have_content '確認メールを、登録したメールアドレス宛に送信しました。メールに記載されたリンクを開いてアカウントを有効にして下さい。'
      save_and_open_page
      user = User.last
      token = user.confirmation_token
      visit user_confirmation_path(confirmation_token: token)
      expect(page).to have_content 'メールアドレスの認証が完了しました。ログインしてください。'
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: 'foo@example.com'
      click_button 'ログイン'
      save_and_open_page
      expect(page).to have_content 'ログインしました。'
   end

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



