class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :hit, :integer
  end
end
