class Event < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  validates :content, :start_date_time, :end_date_time, presence: true
  validates :title, presence: true
  # validates :title, presence:true
  validate :start_date_time_cannot_be_in_past, :end_date_time_cannot_be_before_start_date_time


  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :cover_image


  has_many :event_participants
  has_many :participants, through: :event_participants, source: :user

  def start_date_time_cannot_be_in_past
   

    if start_date_time.present? && start_date_time < DateTime.now
      errors.add(:start_date_time, "can't be in the past")
    end
  end

  def end_date_time_cannot_be_before_start_date_time
    if end_date_time < start_date_time
      errors.add(:end_date_time, "cant be before start date time")
    end
  end

  def cover_image_url
    rails_blob_url(self.cover_image, only_path: false) if self.cover_image.attached?
  end

  def has_joined?(user)
    self.participants.include?(user)
  end
  
end

