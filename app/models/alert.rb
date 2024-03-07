class Alert < ApplicationRecord
  # include Rails.application.routes.url_helpers
  validates :content, presence: true, length: {maximum: 2000}
  validates :title, presence: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy




  # def cover_image_url
  #   #url helpers
  #   rails_blob_url(self.cover_image, only_path: false) if self.cover_image.attached?
  # end
  
end
