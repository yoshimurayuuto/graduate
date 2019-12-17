class Article < ApplicationRecord
  def to_meta_tags
    {
      title: title,
      description: body,
      keywords: keywords
    }
  end
  paginates_per 10
  scope :search_with_title, -> (title) {where("title LIKE ?", "%#{title}%")}
end
