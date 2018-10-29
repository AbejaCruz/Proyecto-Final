class MaterialsController < ApplicationController
  layout 'platform'

  # load_and_authorize_resource
  # before_action :set_material, only: [:show, :edit, :update, :destroy]
  def index
    @location[:sub_menu] = 'list_materials'
    @materials = Material.all
  end

  def new
    @location[:sub_menu] = 'create_material'
    @materials = Material.all
  end

  def create
    @material = Material.new(article_params)
    @material.user_id = current_user.id
    if @material.save
      flash[:success_record] = "Material Registrado Exitosamente"
      redirect_to new_material_path
    else
      flash[:material_errors] = @material.errors
      redirect_to new_material_path
    end
  end

  def show
    @material = Material.find(params[:id])
  end



  private

  def article_params
    params.require(:material).permit(:name)
  end
  end
