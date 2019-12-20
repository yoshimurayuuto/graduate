require 'rails_helper'

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


