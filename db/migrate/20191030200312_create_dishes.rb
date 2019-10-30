class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :cuisine_id
      t.integer :bookmarks_count, :default => 0

      t.timestamps
    end
  end
end
