class Alert < ApplicationRecord
  validates :content, presence: true, length: {maximum: 2000}
  validates :title, presence: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
end
