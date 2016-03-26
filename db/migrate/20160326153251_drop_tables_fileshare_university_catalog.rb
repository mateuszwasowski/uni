class DropTablesFileshareUniversityCatalog < ActiveRecord::Migration
  def change
    drop_table :fileshares
    drop_table :universities
    drop_table :catalogs
    drop_table :identities
    drop_table :universities_users
  end
end
