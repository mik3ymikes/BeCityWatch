# frozen_string_literal: true

class CommentBlueprint < Blueprinter::Base
  identifier :id

  fields :content, :created_at

  view :normal do
    fields :content, :created_at
    association :user, blueprint: UserBlueprint, view: :normal
  end
end
# might need to check on this association?