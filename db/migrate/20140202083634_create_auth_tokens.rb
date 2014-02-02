class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.references :user, index: true
      t.string :token

      t.timestamps
    end
  end
end
