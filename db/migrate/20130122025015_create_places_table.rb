class CreatePlacesTable < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :guid, :null => false
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :tho_dia_link
      t.string :phone
      t.string :email
      t.string :website
      t.text :tag_list
      t.string :city_id, :null => false
      
      t.integer :district_id, :null => false
    end
  end

  def self.down
    drop_table :places
  end
end
