class AddCatalogIdToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :catalog_id, :string
  end
end
