class District < ActiveRecord::Base
  has_many :places
  
  scope :by_city, lambda {|city| where(city_id: city) unless city.nil?}
  
  def self.get_districts(options = {})
    data = (options.blank? || options[:city_id].blank?) ? District.by_city(options[:city_id]) : District.all
    fields = options[:fields].blank? ? [] : options[:fields].split(",")
    fields.blank? ? data : JSON.generate(data.as_json(:only => fields))
  end
end