class Feature < ActiveRecord::Base
  has_many :places
  
  scope :by_place_id, lambda {|p_id|
    _place_feature_rels = PlaceFeatureRel.find_all_by_place_id p_id
    _features = []
    _place_feature_rels.each do |rel|
      _features << Place.find(rel["place_id"]) unless rel["place_id"].blank?
    end
    _features
  }
  
  scope :by_sub_cat_id, lambda {|sc_id|
    return [] if sc_id.blank?
    place_ids = PlaceCategoryRel.find(
      :all,
      :conditions=>"sub_category_id = #{sc_id}").
      collect{|rel| rel[:place_id]}
    common_features = []
    place_ids.each do |p_id|
      _features = Feature.by_place_id p_id
      unless _features.empty?
        common_features << _features
      end
    end
    common_features.flatten!
    common_features.uniq!
    return Feature.all - common_features unless common_features.blank?
    []
  }
end