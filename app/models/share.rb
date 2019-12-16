class Share < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :declaration, presence: true
end
