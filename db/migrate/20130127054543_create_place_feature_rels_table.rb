class CreatePlaceFeatureRelsTable < ActiveRecord::Migration
  def up
    create_table :place_feature_rels do |t|
      t.integer :place_id, :null => false
      t.integer :feature_id, :null => false
      
      t.timestamps
    end
    
    add_index :place_feature_rels, [:place_id, :feature_id], :name => "place_feature_index"
  end

  def down
    drop_table :place_feature_rels
  end
end
