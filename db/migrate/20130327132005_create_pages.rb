class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name", :limit => 25
      t.string "permalink", :limit => 100;
      t.integer "position"
      t.boolean "visible"
      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
end
