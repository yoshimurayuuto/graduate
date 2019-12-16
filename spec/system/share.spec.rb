RSpec.describe 'Tasks', type: :system do


  describe 'Users' do
    describe '#sessions/new' do
  # it "search_title_and_search_task" do
    # fill_in "task_title", with: '9'
    # fill_in "task_status", with: '1'
    before do
      User.create!(id: 1, name: "a", email: "000@gmail.com", password: "000@gmail.com", password_confirmation: "000@gmail.com")
      Task.create!(title: "9", status: "完了", content: "4", priority: 1, expiration_date: "2019-10-24", user_id: 1)
      Task.create!(title: "5", status: "未完了", content: "4", priority: 2, expiration_date: "2019-10-24", user_id: 1)
      Task.create!(title: "19", status: "未着手", content: "4", priority: 0, expiration_date: "2019-10-24", user_id: 1)
  
    end
  
    # task = Task.new(title: "9", status: 1)
    # context "search" do
    scenario 'ログインする' do
      visit new_session_path
      # ログインフォームにEmailとパスワードを入力する
      fill_in 'Email', with: '000@gmail.com'
      fill_in 'Password', with: '000@gmail.com'
      # ログインボタンをクリックする
      click_on 'Log in'
      # ログインに成功したことを検証する
      expect(page).to have_content 'ログイン'
    end
    context "未ログインユーザーの場合" do
      it "redirects to the sign-in page" do
        visit new_session_path
      end
    end
  end
  end
  end