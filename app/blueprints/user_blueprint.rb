# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    
    view :me do
        fields :username, :email, :zipcode
    end

    view :normal do
        fields :username
    end

  

    # association :events, blueprint: EventBlueprint, view: :profile do |user, options|
    #     user.events.order(start_date_time: :desc).limit(5)
    # end
end
