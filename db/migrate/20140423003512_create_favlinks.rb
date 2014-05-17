class CreateFavlinks < ActiveRecord::Migration
  def change
    create_table :favlinks do |t|
      t.string :title, null: false
      t.text :description
      t.string :linkurl, null: false
      t.references :writer, index: true
      t.boolean :shared, default: true
      t.references :bundlelink, index: true

      t.timestamps
    end
  end
end
