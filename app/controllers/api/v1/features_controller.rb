module Api
  module V1
    class FeaturesController < ApplicationController
      respond_to :json
      
      def get_features
        respond_with JSON.generate Feature.all.as_json
      end
      
    end
  end
end