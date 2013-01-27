class PlaceFeatureRel < ActiveRecord::Base
  belongs_to :place
  belongs_to :feature
end