class AddTables < ActiveRecord::Migration
  def change
    create_table :universities_users, :id => false do |t|
     t.integer :user_id
     t.integer :university_id
   end
  end
end
