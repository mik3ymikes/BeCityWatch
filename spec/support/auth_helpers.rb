module AuthHelpers
    def auth_token_for_user(user)
        JWT.encode({user_id: user.id}, Rails.application.secret_key_base)
        # JWT.encode({user_id: user.id}, Rails.application.secret_key_base solved issue!! cant use secrets!!)
    end
end