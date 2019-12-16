RSpec.describe 'Users', type: :system do


  describe 'Users' do
  
    before do
      @password = "814@gmail.com"
      @user = User.create(name: "000@gmail.com", email: "814@gmail.com", password: @password, password_confirmation: "814@gmail.com")
      visit new_user_registration_path
      fill_in '名前', with: @user.name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'Password', with: @password
      fill_in 'Password', with: @password
      click_on '新規登録'
      save_and_open_page
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'Password', with: @password
      click_on 'ログイン'
    end
  
    context "他のユーザーをフォローする" do
      it "フォロー(フォロー解除機能)" do
        visit users_path
        click_on "フォロー"
        expect(page).to be_valid
      end
    end
  
    # context "検索する" do
    #   it "ステータスで検索できる" do
    #     visit tasks_path
    #     select "未着手", from: "task_status"
    #     click_button "検索する"
    #      expect(page).to have_content @task.status
    #   end
    # end
  
    # context "検索する" do
    #   it "タイトルで検索できる" do
    #     visit tasks_path
    #     fill_in "task_title", with: @task.title
    #     click_button "検索する"
    #     expect(page).to have_content @task.title
    #   end
    # end
  
    # context "タスクラベル" do
    #   it "ラベルにチェックが入っているかどうか" do
    #     visit new_task_path
    #     check @task.label
    #     expect(page).to have_checked_field('task[label_ids][]')
    #     click_button "登録する"
    #     expect(page).to have_content @task.label
    #   end
    # end
  
    end
  end