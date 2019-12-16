require 'rails_helper'

feature 'Sign up' do
  background do
    ActionMailer::Base.deliveries.clear
  end

  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  scenario 'メールアドレスのみでユーザー登録を行い、パスワードを後から設定する' do
    visit new_user_registration_path
    expect(page).to have_http_status :ok
    fill_in 'メールアドレス', with: 'foo@example.com'
    fill_in 'password', with: 'foo@example.com'
    fill_in 'password_confirmation', with: 'foo@example.com'
    click_button '新規登録'
    expect(page).to have_content '確認メールを、登録したメールアドレス宛に送信しました。メールに記載されたリンクを開いてアカウントを有効にして下さい。'
    save_and_open_page

  #   mail = ActionMailer::Base.deliveries.last
  #   url = extract_confirmation_url(mail)
  #   visit url
  #   expect(page).to have_content 'Enter new password'

user = User.last
token = user.confirmation_token
visit user_confirmation_path(confirmation_token: token)
expect(page).to have_content 'メールアドレスの認証が完了しました。ログインしてください。'

    # 登録に失敗する場合
    save_and_open_page
    click_button 'ログイン'
    expect(page).to have_content "メールアドレスかパスワードが違います。"

    fill_in 'メールアドレス', with: '12345678'
    fill_in 'パスワード', with: '123456789'
    click_button "ログイン"
    expect(page).to have_content 'メールアドレスまたはパスワードが無効です。'
    save_and_open_page

  #   # 登録に成功する場合
    fill_in 'メールアドレス', with: 'foo@example.com'
    fill_in 'パスワード', with: 'foo@example.com'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
    save_and_open_page
    
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
    save_and_open_page
  end
end