class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 30}
    validate :vaildate_username
    validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 255}, 
    format: {
        with: URI::MailTo::EMAIL_REGEXP
    }
    validates :zipcode, presence: true, length: { maximum: 5 }, numericality: { only_integer: true }


    has_many :alerts, dependent: :destroy
    has_many :events, dependent: :destroy
    has_many :comments, dependent: :destroy

    # has_many :created_events, class_name: "Event", foreign_key: "user_id"

    
    private
    def vaildate_username
        unless username =~ /\A[a-zA-Z0-9_]+\Z/
            errors.add(:username, "can only contain letters, numbers, and underscores")
        end
    end
end
