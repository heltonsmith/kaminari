class AveController < ApplicationController


    def index 
        response = RestClient::Request.new(
            :method => :get,
            :url => "https://aves.ninjas.cl/api/birds"
        ).execute

        @resultado = JSON.parse(response.to_str)
        @pager = Kaminari.paginate_array(@resultado).page(params[:page]).per(10)
    end


end
