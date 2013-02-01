module Api
  module V1
    class PlacesController < ApplicationController
      respond_to :json
      
      # get places by district_id and sub_cat_id
      def get_places
        render :text => "missing params" and return if params[:district_id].blank? || params[:sub_cat_ids].blank?
        render :text => "missing field name(s)" and return if params[:fields].blank?
        sub_cat_ids = params[:sub_cat_ids].blank? ? [] : params[:sub_cat_ids].split(",")
        fields = params[:fields].blank? ? [] : params[:fields].split(",")
        places = []
        sub_cat_ids.each do |sub_id|
          _result = Place.by_district_id(params[:district_id]).by_sub_cat_id(sub_id)          
          respond_with [] and return if _result.empty?
          
          if places.empty?
            places << _result
          else
            places.flatten!
            places = [places.to_a, _result.to_a].reduce(:&)
            respond_with [] and return if places.blank?
          end
        end

        places.flatten!
        places.uniq! unless places.blank?
        respond_with JSON.generate places.as_json(:only => fields)
      end
      
    end
  end
end