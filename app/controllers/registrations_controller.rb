class RegistrationsController < Devise::RegistrationsController
  def new
    @provinces = Province.all
  end
  
  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :city, :address, :post_code, :phone_number, :email, :province_id, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :city, :address, :post_code, :phone_number, :email, :province_id, :password, :password_confirmation, :current_password)
    end
end
