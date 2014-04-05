class AddColumnToComment < ActiveRecord::Migration
  def change
	add_column :comments, :title, :string
	add_column :comments, :content, :text
	add_reference :comments, :writer, index: true
  end
end
