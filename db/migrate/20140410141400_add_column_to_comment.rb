class AddColumnToComment < ActiveRecord::Migration
  def change
	add_column :comments, :content, :text
	add_reference :comments, :writer, index: true
	add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
