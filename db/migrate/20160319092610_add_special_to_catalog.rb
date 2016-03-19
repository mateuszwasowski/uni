class AddSpecialToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :special, :boolean, default: false
  end
end
