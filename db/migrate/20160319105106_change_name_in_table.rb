class ChangeNameInTable < ActiveRecord::Migration
  def change
    rename_column :catalogs, :univerity_id, :university_id
  end
end
