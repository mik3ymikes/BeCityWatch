class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
end
