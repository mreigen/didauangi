class CreateSubCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :sub_categories do |t|
      t.string :name, :null => false
      t.integer :main_category_id, :null => false
    end
  end

  def self.down
    drop_table :sub_categories
  end
end
