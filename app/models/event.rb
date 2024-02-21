class Event < ApplicationRecord
  validates :content, :start_date_time, :end_date_time, presence: true
  # validates :title, presence:true
  validate :start_date_time_cannot_be_in_past, :end_date_time_cannot_be_before_start_date_time


  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

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
end

