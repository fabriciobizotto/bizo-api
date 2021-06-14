module Api
  module V1
    class CategoriesController < Api::V1::ApiController
      before_action :set_category, only: %i[show update destroy]

      # GET /categories
      def index
        @categories = Category.left_outer_joins(:category).allByUser(current_user).order(
          'categories_categories.title'
        )

        render json: @categories.as_json(include: :category)
      end

      # GET /categories/1
      def show
        render json: @category
      end

      # POST /categories
      def create
        @category = Category.new(category_params)
        if @category.save
          render json: @category.as_json(include: :category), status: :created # , location: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          render json: @category.as_json(include: :category)
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /categories/1
      def destroy
        @category.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:title, :active, :category_id,
                                         :user_id).merge(user: current_user)
      end
    end
  end
end
