class AddTitleToAlerts < ActiveRecord::Migration[7.1]
  def change
    add_column :alerts, :title, :string
  end
end
