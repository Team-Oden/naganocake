class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
