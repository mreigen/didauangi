module Api
  module V1
    class DistrictsController < ApplicationController
      respond_to :json
      
      def get_districts
        data = params[:city_id].blank? ? District.all : District.by_city(params[:city_id])
        fields = params[:fields].blank? ? [] : params[:fields].split(",")
        respond_with JSON.generate data.as_json(:only => fields)
      end
      
    end
  end
end