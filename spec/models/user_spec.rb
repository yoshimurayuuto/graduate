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
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: 'foo@example.com'
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
   end


   #Userモデルのバリデーションのテスト
   #パスワードを記入しなかったら無効
   
   it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end


  #パスワードと確認用パスワードが一致するか否かのテスト
  context 'パスワードが一致する場合' do
    user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hogehoge')
    user.valid?
    it 'エラーにならない' do
      expect(user.errors[:password_confirmation]).not_to be_present
    end
  end
  context 'パスワードが一致しない場合' do
    user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hoge')
    user.valid?
    it 'エラーになる' do
      expect(user.errors[:password_confirmation]).to be_present
    end
  end

  #メールアドレスを記入しなかったら無効
  it "is invalid without a email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
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



# @password = "814@gmail.com"
    #   @user = User.create(name: "000@gmail.com", email: "814@gmail.com", password: @password, password_confirmation: "814@gmail.com")
    #   visit new_user_registration_path
    #   # fill_in '名前', with: @user.name
    #   fill_in 'メールアドレス', with: @user.email
    #   fill_in 'パスワード', with: @password
    #   fill_in '確認用パスワード', with: @password
    #   click_on '新規登録'
    #   click_on "Confirm my account" 
    #   visit new_user_session_path
    #   fill_in 'メールアドレス', with: @user.email
    #   fill_in 'Password', with: @password
    #   click_on 'ログイン'
        # 新規作成
        # visit new_user_registration_path
        # fill_in "name", with: 'tanaka'
        # fill_in 'メールアドレス', with: 'tanaka@sample.com'
        # fill_in 'password', with: '000000'
        # fill_in 'password_confirmation', with: '000000'
        # save_and_open_page
        # click_button "新規登録"
        # save_and_open_page
        # expect(page).to have_content "アカウント登録が完了しました。"
        # 削除