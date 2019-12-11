class Philosophy < ApplicationRecord
  def to_meta_tags
    {
      title: title,
      description: body,
      keywords: keywords
    }
  end
  scope :search_with_title, -> (title) {where("title LIKE ?", "%#{title}%")}
end
