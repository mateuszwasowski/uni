class CreateFileshares < ActiveRecord::Migration
  def change
    create_table :fileshares do |t|
      t.string :file
      t.string :description
      t.string :user_id
      t.string :catalog_id
      t.timestamps null: false
    end
  end
end
