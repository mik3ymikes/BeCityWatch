# frozen_string_literal: true

class EventBlueprint < Blueprinter::Base
    identifier :id

    fields :content, :start_date_time, :end_date_time, :created_at, :title, :cover_image_url

   

    view :short do
        fields :content, :start_date_time, :end_date_time, :created_at, :title, :cover_image_url
        association :user, blueprint: UserBlueprint, view: :normal
    end


    view :long do
        fields :content, :start_date_time, :end_date_time, :created_at, :title, :cover_image_url
        # association :comments, blueprint: CommentBlueprint, view: :normal
        association :participants, blueprint: UserBlueprint, view: :normal
        association :user, blueprint: UserBlueprint, view: :normal
        association :comments, blueprint: CommentBlueprint, view: :normal
        field :has_joined do |event, options|
            event.has_joined?(options[:current_user])
        end
    end

    # view :longer do
    #     fields :content, :created_at, :title
    #     association :user, blueprint: UserBlueprint, view: :normal
    #     # association :comments, blueprint: UserBlueprint, view: :normal
    #     association :comments, blueprint: CommentBlueprint, view: :normal
    # end
end
