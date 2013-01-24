class SubCategory < ActiveRecord::Base
  has_many :place_category_rel
  has_many :main_categories, :through => :place_category_rel
  has_many :places, :through => :place_category_rel
  
  scope :by_main_cat_id, (lambda do |main_cat_id|
    where(main_category_id: main_cat_id) unless main_cat_id.nil?
  end)
end