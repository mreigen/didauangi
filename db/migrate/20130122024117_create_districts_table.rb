class CreateDistrictsTable < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :guid, :null => false
      t.string :name, :null => false
      t.string :city_id, :null => false
      t.string :district_type, :null => false, :default => "Quan"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end
