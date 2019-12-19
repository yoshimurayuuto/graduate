class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorite_articles
  end

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    if favorite.article.user.name.present?
      redirect_to articles_url, notice: "#{favorite.article.user.name}さんの記事をお気に入り登録しました"
    else
      redirect_to articles_url, notice: "#{favorite.article.user.username}さんの記事をお気に入り登録しました"
    end

  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_url, notice: "#{favorite.article.user.name}さんの記事をお気に入り解除しました"
  end
end
