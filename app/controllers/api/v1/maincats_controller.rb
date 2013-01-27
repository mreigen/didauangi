module Api
  module V1
    class MaincatsController < ApplicationController
      respond_to :json
      
      def get_maincats
        data = MainCategory.select{|mc| [1,2,3,7].include? mc[:id]}
        #data = MainCategory.all
        respond_with JSON.generate data.as_json
      end
      
    end
  end
end