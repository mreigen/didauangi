class CreatePlaceCategoryRelsTable < ActiveRecord::Migration
  def self.up
    create_table :place_category_rels do |t|
      t.integer :place_id, :null => false
      t.integer :main_category_id, :null => false
      t.integer :sub_category_id, :null => false
    end
    
    add_index :place_category_rels, [:place_id, :main_category_id, :sub_category_id], :name => "place_cat_rel_index"
  end

  def self.down
    drop_table :place_category_rels
  end
end
