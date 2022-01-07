class CreateEventJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :event_joins do |t|
      
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :status
      t.datetime :joined_at
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
