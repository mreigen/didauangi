module Api
  module V1
    class PlacesController < ApplicationController
      respond_to :json
      
      # get places by district_id and sub_cat_id
      def get_places
        render :text => "missing params" and return if params[:district_id].blank? || params[:sub_cat_id].blank?
        render :text => "missing field name(s)" and return if params[:fields].blank?
        fields = params[:fields].blank? ? [] : params[:fields].split(",")
        data = JSON.generate Place.by_district_id(params[:district_id])
              .by_sub_cat_id(params[:sub_cat_id])
              .as_json(:only => fields)
        respond_with data
      end
      
    end
  end
end