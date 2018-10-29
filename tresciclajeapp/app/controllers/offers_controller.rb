class OffersController < ApplicationController
  layout 'platform'

  # load_and_authorize_resource
  # before_action :set_offer, only: [:show, :edit, :update, :destroy]
  def index
    @location[:sub_menu] = 'list_offers'
    if current_user.has_role?(:admin)
      @offers = Offer.all
    elsif current_user.has_role?(:supplier)
      @offers = Offer.where(:user_id => current_user.id)
    end
  end

  def new
    @location[:sub_menu] = 'create_offer'
    if current_user.has_role?(:admin)
      @offers = Offer.all
    elsif current_user.has_role?(:supplier)
      @offers = Offer.where(:user_id => current_user.id)
    end
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.category.nil?
    else
      price = @offer.category.base_price
      iva = @offer.category.iva
      @offer.price = @offer.total_price(@offer.actual_amount, price, iva )
    end
    @offer.user_id = current_user.id
    @offer.initial_amount = @offer.actual_amount
    @offer.disponible = true
    if @offer.registration_date.nil?
    else
      @offer.expiration_date = @offer.expiration_offer(@offer.registration_date)
    end
    if @offer.save
      flash[:success_record] = "Oferta Registrada Exitosamente"
      redirect_to new_offer_path
    else
      flash[:offer_errors] = @offer.errors
      redirect_to new_offer_path
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  private

  def offer_params
    params.require(:offer).permit(:category_id, :description, :actual_amount, :registration_date)
  end
end
