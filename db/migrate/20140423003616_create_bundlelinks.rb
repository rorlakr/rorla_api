class CreateBundlelinks < ActiveRecord::Migration
  def change
    create_table :bundlelinks do |t|
      t.string :title, null: false
      t.text :description
      t.references :writer, index: true, null: false
      t.boolean :shared, default: true

      t.timestamps
    end
  end
end
