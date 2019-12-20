require 'rails_helper'


RSpec.feature "ユーザー", type: :feature do

  background do
    @password = "814@gmail.com"
    @user = User.create(name: "000@gmail.com", email: "814@gmail.com", password: @password, password_confirmation: "814@gmail.com")
    
    ActionMailer::Base.deliveries.clear

    def extract_confirmation_url(mail)
      body = mail.body.encoded
      body[/http[^"]+/]
    end

    
      visit new_user_registration_path
      expect(page).to have_http_status :ok
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'password', with: 'foo@example.com'
      fill_in 'password_confirmation', with: 'foo@example.com'
      click_button '新規登録'
      expect(page).to have_content '確認メールを、登録したメールアドレス宛に送信しました。メールに記載されたリンクを開いてアカウントを有効にして下さい。'
      user = User.last
      token = user.confirmation_token
      visit user_confirmation_path(confirmation_token: token)
      expect(page).to have_content 'メールアドレスの認証が完了しました。ログインしてください。'
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: 'foo@example.com'
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
   end


  #"他のユーザーをフォローする" 
    it "フォロー(フォローを解除)" do
      visit users_path
      click_button "フォロー"
      click_on "マイページ"
      expect(page).to have_content "000@gmail.com"
      visit users_path
      click_button "フォローを解除"
      save_and_open_page
      click_on "マイページ"
      save_and_open_page
      expect(page).to have_content ""
      save_and_open_page
  end
end



