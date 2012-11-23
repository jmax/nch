class Users::RegistrationsController < Devise::RegistrationsController

private
  def resource_params
    params.require(:user).permit(
      :full_name, :email, :password, 
      :password_confirmation, :remember_me,
      :company_attributes
    )
  end
end
