# frozen_string_literal: true

class AlertBlueprint < Blueprinter::Base
    identifier :id

    view :alert do
        fields :content, :created_at
    end
end
