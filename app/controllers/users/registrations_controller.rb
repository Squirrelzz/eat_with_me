class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    build_resource({})
    self.resource.children.build
    respond_with self.resource
  end

  def create
    resource = User.new(
      params.require(:user).permit(
        :email,
        :name,
        :current_password,
        :password,
        :password_confirmation,
        :remember_me,
        :first_name,
        :last_name,
        :phone_number,
        :reset_password_token,
        :time_zone,
        :children => [ :name, :email, :password ],
        :children_attributes => [ :name, :email, :password ]
      )
    )

    resource.children.build do |p|
      p.name = params[:children][:name]
      p.email = params[:children][:email]
      p.password = params[:children][:password]
    end
    resource.save

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {
      params.require(:user).permit(
        :email,
        :name,
        :current_password,
        :password,
        :password_confirmation,
        :remember_me,
        :first_name,
        :last_name,
        :phone_number,
        :reset_password_token,
        :time_zone,
        :children_attributes => [ :name, :email, :password ]
      )
    }
  end
end
