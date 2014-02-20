class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps
    end
  end
end
