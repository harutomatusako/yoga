class ChangeImageOfEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :image, :image_id
    change_column :events, :image_id, :string
  end
end
