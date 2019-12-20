require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
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
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: 'foo@example.com'
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
   end


  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  # scenario "他のユーザーをフォローする" do

    it "自殺を減らすために私たちは何ができるかについて投稿" do
      visit shares_path
     Share.create(declaration: "aa", user_id: @user.id)
    end
  end


  


      # visit users_path
      # save_and_open_page
      # click_button "つながりを解除"
      # save_and_open_page
      # expect(page).to have_content 'ユーザー一覧'

