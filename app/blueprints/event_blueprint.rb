# frozen_string_literal: true

class EventBlueprint < Blueprinter::Base
    identifier :id

    # view :profile do
    #     fields :content, :start_date_time, :end_date_time
    # end

    # view :profile do
    #     fields :content, :start_date_time, :end_date_time
    # end

    view :long do
        fields :content, :start_date_time, :end_date_time, :created_at, :title, :cover_image_url
        association :user, blueprint: UserBlueprint, view: :normal
    end
end
