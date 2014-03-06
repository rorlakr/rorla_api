class AddTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_reference :posts, :writer, index: true
    add_column :posts, :published, :boolean, default: false
  end
end
