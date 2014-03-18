class AddColumnToEvent < ActiveRecord::Migration
  def change
      add_column :events, :description, :text
      add_column :events, :latitude, :decimal, {:precision=>10, :scale=>6}
      add_column :events, :longitude, :decimal, {:precision=>10, :scale=>6}
      add_column :events, :updated_time, :datetime
      add_column :events, :material, :text
      add_column :events, :modifiable, :boolean, default: false
  end
end
