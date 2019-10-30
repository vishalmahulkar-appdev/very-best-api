class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :bookmarks_count, :default => 0

      t.timestamps
    end
  end
end
