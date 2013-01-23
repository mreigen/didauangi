class CreateMainCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :main_categories do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :main_categories
  end
end
