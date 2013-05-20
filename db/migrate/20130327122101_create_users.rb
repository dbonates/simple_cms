class CreateUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string "username", :limit => 25
      t.string "email", :default => "", :limit => 25, :null => false
      t.string "password", :limit => 40;
      t.string "salt", :limit => 40
      t.timestamps
    end
    puts "*** About to add an index ***"
    add_index("admin_users", "username")
  end
end
