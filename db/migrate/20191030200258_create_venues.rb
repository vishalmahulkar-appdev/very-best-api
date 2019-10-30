class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :neighborhood_id
      t.integer :bookmarks_count, :default => 0

      t.timestamps
    end
  end
end
