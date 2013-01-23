class PlaceCategoryRel < ActiveRecord::Base
  belongs_to :place
  belongs_to :main_category
  belongs_to :sub_category
end