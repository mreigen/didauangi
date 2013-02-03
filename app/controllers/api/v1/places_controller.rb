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
        feature_ids = params[:feature_ids].blank? ? [] : params[:feature_ids].split(",")
        
        places = []
        sub_cat_ids.each do |sub_id|
          _result = Place.by_district_id(params[:district_id]).by_sub_cat_id(sub_id)          
          respond_with [] and return if _result.empty?
          
          unless _result.empty?
            places << _result
          end
          
          places.flatten!
          places.uniq! unless places.blank?
        end

        feature_ids.each do |f_id|
          _result = Place.by_district_id(params[:district_id]).by_feature_id(f_id)          
          respond_with [] and return if _result.empty?
          
          if places.empty?
            places << _result
          else
            places.flatten!
            places = [places.to_a, _result.to_a].reduce(:&)
            places = JSON.load places.to_json
            places = places.select{|p| p["feature_id"] = f_id}
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