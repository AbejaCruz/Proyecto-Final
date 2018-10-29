class Core::UsersController < ApplicationController
  layout 'platform'

  def index
    @location[:sub_menu] = 'users_list'    
    @users = resolve_users    
  end

  def new
    @location[:sub_menu] = 'users_new'
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def add_role
    user = User.find(params[:user_id])
    user.add_role params[:role].to_sym
    user.save
    redirect_to core_user_path(user)
  end

  def remove_role
    user = User.find(params[:user_id])
    user.remove_role params[:role].to_sym
    user.save
    redirect_to core_user_path(user)
  end

  def create
    user = User.new(user_params)
    user.city = City.find(user_params[:city_id]) if user_params[:city_id]
    user.zone = Zone.find(user_params[:zone_id]) if user_params[:zone_id]
    user.created_by = current_user.id
    if user.save     
      user.add_role params[:role].to_sym
      user.prefix = user.add_prefix(user.id, user.roles.first.name)
      user.save
      flash[:success_record] = "Usuario Registrado Exitosamente"
      redirect_to new_core_user_path
    else
      flash[:user_errors] = user.errors
      redirect_to new_core_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to core_user_path(user)
    else
      flash[:user_errors] = user.errors
      redirect_to edit_core_user_path
    end
  end

  def set_location
    @location = { menu: 'users', sub_menu: 'not_defined' }
  end

  private

  def resolve_users
    return @users = User.all if admin?
    return User.where(created_by: current_user.id) if supplier?
  end

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :nit,
                                 :email,
                                 :phone,
                                 :department,
                                 :address,
                                 :city_id,
                                 :description,
                                 :photo, :zone_id)
  end
end
