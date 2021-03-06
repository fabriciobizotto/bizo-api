module Api
  module V1
    class BeersController < Api::V1::ApiController
      skip_before_action :authenticate_user!, only: [:index, :show]
      before_action :set_beer, only: [:show, :update, :destroy]

      # GET /beers
      def index
        @beers = Beer.all
    
        render json: @beers
      end
    
      # GET /beers/1
      def show
        render json: @beer
      end
    
      # POST /beers
      def create
        @beer = Beer.new(beer_params)
    
        if @beer.save
          render json: @beer, status: :created, location: @beer
        else
          render json: @beer.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /beers/1
      def update
        if @beer.update(beer_params)
          render json: @beer
        else
          render json: @beer.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /beers/1
      def destroy
        @beer.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_beer
          @beer = Beer.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def beer_params
          params.require(:beer).permit(:name, :abv)
        end
    end
  end
end