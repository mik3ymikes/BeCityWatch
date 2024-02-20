class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 30}
    validate :vaildate_username
    validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 255}, 
    format: {
        with: URI::MailTo::EMAIL_REGEXP
    }


    has_many :alerts
    private
    def vaildate_username
        unless username =~ /\A[a-zA-Z0-9_]+\Z/
            errors.add(:username, "can only contain letters, numbers, and underscores")
        end
    end
end
