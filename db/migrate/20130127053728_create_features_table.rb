class CreateFeaturesTable < ActiveRecord::Migration
  def up
    create_table :features do |t|
      t.string :name, :null => false
    end
  end

  def down
    drop_table :features
  end
end
