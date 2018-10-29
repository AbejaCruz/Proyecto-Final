class PetitionsController < ApplicationController
  layout 'platform'

  def new
    if current_user.has_role?(:admin)
      @petitions = Petition.all
    elsif current_user.has_role?(:buyer)
      @petitions = Petition.where(user_id: current_user.id)
    end
  end

  def create
    @petition = Petition.new(article_params)
    @petition.user_id = current_user.id
    @petition.initial_amount = @petition.actual_amount
    @petition.status = 'ABIERTA'
    if @petition.save
      flash[:success_record] = 'Petición Registrada Exitosamente'
      redirect_to new_petition_path
    else
      flash[:petition_errors] = @petition.errors
      redirect_to new_petition_path
    end
  end

  def show
    @petition = Petition.find(params[:id])
    @offers = Offer.where(category_id: @petition.category_id, disponible: true)
  end

  def index
    if current_user.has_role?(:admin)
      @petitions = Petition.all
    elsif current_user.has_role?(:buyer)
      @petitions = Petition.where(user_id: current_user.id)
    end
  end

  private

  def article_params
    params.require(:petition).permit(:category_id, :actual_amount, :user_id, :shipping_address, :description)
  end
end
