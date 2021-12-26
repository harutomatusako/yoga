class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :detail, null: false
      t.text :image, null: false
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
      t.integer :location, null: false
      t.string :city, null: false
      t.string :park, null: false
      t.timestamps
    end
  end
end
