class Place < ActiveRecord::Base
  has_many :place_category_rel
  has_many :place_feature_rel
  
  has_many :main_categories, :through => :place_category_rel
  has_many :sub_categories, :through => :place_category_rel
  has_many :features, :through => :place_feature_rel
  
  belongs_to :district
  
  scope :by_district_id, lambda { |d_id|
    self.scoped.where("district_id = ?", d_id) unless d_id.blank?
  }
  
  scope :by_sub_cat_id, lambda { |sc_id|
    return [] if sc_id.blank?
    place_ids = PlaceCategoryRel.find(
      :all,
      :conditions=>"sub_category_id = #{sc_id}").
      collect{|rel| rel[:place_id]}
    self.scoped.where("id IN ( ? )", place_ids) unless place_ids.blank?
  }
  
  scope :by_feature_id, lambda { |f_id|
    return [] if f_id.blank?
    place_ids = PlaceFeatureRel.find(
      :all,
      :conditions=>"feature_id = #{f_id}").
      collect{|rel| rel[:place_id]}
    self.scoped.where("id IN ( ? )", place_ids) unless place_ids.blank?
  }
end