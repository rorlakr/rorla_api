class AddTitleUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :bulletins, :title, unique: true
  end

  def self.down
    remove_index :bulletins, :title
  end
end
