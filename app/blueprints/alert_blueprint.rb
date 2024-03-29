# frozen_string_literal: true

class AlertBlueprint < Blueprinter::Base
    identifier :id

    view :alert do
        fields :content, :created_at, :title
    end


    view :long do
        fields :content, :created_at, :title
        association :user, blueprint: UserBlueprint, view: :normal
       
    end

    view :longer do
        fields :content, :created_at, :title
        association :user, blueprint: UserBlueprint, view: :normal
        # association :comments, blueprint: UserBlueprint, view: :normal
        association :comments, blueprint: CommentBlueprint, view: :normal
    end

end
