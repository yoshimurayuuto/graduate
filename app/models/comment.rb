class Comment < ApplicationRecord
  belongs_to :share
  validates :content, presence: true
end
