require 'rails_helper'

RSpec.feature "ユーザー", type: :feature do

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