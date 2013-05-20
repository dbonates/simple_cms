class AlterUsers < ActiveRecord::Migration
  def up
    add_column("admin_users", "first_name", :string, :limit => 25)
    add_column("admin_users", "last_name", :string, :limit => 25)
    rename_column("admin_users", "password", "hashed_password")
  end

  def down
    remove_column("admin_users", "first_name")
    remove_column("admin_users", "last_name")
    rename_column("admin_users", "hashed_password", "password")
  end
end
