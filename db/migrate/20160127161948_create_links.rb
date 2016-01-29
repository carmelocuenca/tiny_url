class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :identifier
      t.integer :url_id

      t.timestamps null: false
    end
    add_index :links, :identifier, unique: true
  end
end
