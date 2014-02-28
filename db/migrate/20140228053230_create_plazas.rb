class CreatePlazas < ActiveRecord::Migration
  def change
    create_table :plazas do |t|
      t.integer :postit_id
      t.string :postit_type
      t.boolean :visible

      t.timestamps
    end
  end
end
