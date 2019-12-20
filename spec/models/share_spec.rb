require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "ユーザー", type: :feature do

#Shareモデルバリデーションのテスト
#内容をからのまま投稿したら無効

    it "is invalid without a declaration" do
      share = Share.new(declaration: nil)
      share.valid?
      expect(share.errors[:declaration]).to include("を入力してください")
    end

    #コメントモデルバリデーションテスト
  #内容をからのまま投稿したら無効

    it "is invalid without a content" do
      comment = Comment.new(content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end

  end


  


      # visit users_path
      # save_and_open_page
      # click_button "つながりを解除"
      # save_and_open_page
      # expect(page).to have_content 'ユーザー一覧'

