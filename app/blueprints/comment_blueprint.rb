# frozen_string_literal: true

class CommentBlueprint < Blueprinter::Base
    dentifier :id

  fields :content, :created_at

  view :short do
    include_association :user, blueprint: UserBlueprint, view: :normal
  end
end
# might need to check on this association?