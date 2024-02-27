# frozen_string_literal: true

class EventBlueprint < Blueprinter::Base
    identifier :id

    # view :profile do
    #     fields :content, :start_date_time, :end_date_time
    # end

    view :profile do
        fields :content, :start_date_time, :end_date_time
    end

    view :short do
        fields :content, :start_date_time, :end_date_time
        association :user, blueprint: UserBlueprint, view: :normal
    end
end
