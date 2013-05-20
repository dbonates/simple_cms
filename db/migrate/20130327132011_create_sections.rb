class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string "page_id"
      t.string "name", :limit => 25
      t.integer "position"
      t.boolean "visible", :default => false
      t.string "content_type", :limit => 20;
      t.text "content"
      t.timestamps
    end
    add_index("sections", "page_id")
  end
end
