class Article < ApplicationRecord
  paginates_per 10
  scope :search_with_title, -> (title) {where("title LIKE ?", "%#{title}%")}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
