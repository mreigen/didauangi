class District < ActiveRecord::Base
  has_many :places
  
  scope :by_city, lambda {|city| where(city_id: city) unless city.nil?}
end