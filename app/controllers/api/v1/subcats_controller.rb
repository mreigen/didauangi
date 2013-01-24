module Api
  module V1
    class SubcatsController < ApplicationController
      respond_to :json
      
      def get_subcats
        data = params[:main_cat_id].blank? ? SubCategory.all : SubCategory.by_main_cat_id(params[:main_cat_id])
        respond_with JSON.generate data.as_json
      end
      
    end
  end
end