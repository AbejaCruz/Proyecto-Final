  class CategoriesController < ApplicationController
    layout 'platform'

    def index
      @location[:sub_menu] = 'list_categories'
      @categories = Category.all
    end

    def new
      @location[:sub_menu] = 'create_category'
      @rcategories = Category.all
      @categories = Category.new
    end

    def create
      @category = Category.new(category_params)
      @category.user_id = current_user.id
      if @category.save
        flash[:success_record] = "Categoria Registrada Exitosamente"
        redirect_to new_category_path
      else
        flash[:category_errors] = @category.errors
        redirect_to new_category_path
      end
    end

    def show
      @category = Category.find(params[:id])
    end

    def set_location
      @location = { menu: 'categories', sub_menu: 'not_defined' }
    end

    private

    def category_params
      params.require(:category).permit(:material_id, :name, :base_price, :iva)
    end
  end
