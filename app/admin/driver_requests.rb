ActiveAdmin.register DriverRequest do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :status
  # permit_params :email, :password
  #
  # or 
  #
  # permit_params do
  #   permitted = [:name, :email, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    # This code is evaluated within the controller class

    def update
       # byebug
      @driver_request = DriverRequest.find(params['id'])
      
      if @driver_request.update(name: params['driver_request']['name'],
        email: params['driver_request']['email'],status: params['driver_request']['status'])
        DriverRequestMailer.with(driver_request: @driver_request).new_driver_request_email.deliver_now


        if (params['driver_request']['status']=='approved')
          user = User.create(email:params['driver_request']['email'],password:(params['driver_request']['name'][0,2]+'@123'),
            is_driver: true)  
          Driver.create(name: params['driver_request']['name'],user_id: user.id)
        end
        redirect_to admin_driver_requests_path
      else
        redirect_to edit_admin_driver_request_path 
      end
    end
  end
end

