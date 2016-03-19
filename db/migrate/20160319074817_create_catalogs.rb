class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :univerity_id
      t.string :name
      t.string :user_id
      t.timestamps null: false
    end
  end
end
