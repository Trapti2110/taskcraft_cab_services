class DriverRequestsController < ApplicationController
	def new
		@driver_request = DriverRequest.new
  end

  def show
    @driver_request = DriverRequest.find(params[:id])
  end

  def create
    @driver_request = DriverRequest.create(driver_params)
    if @driver_request.save
      flash[:success] = "Thanks! I'll be in touch soon!"
      redirect_to 'driver_request_path'
    else
      render 'new_driver_request_path'
    end
	end

  def show_request                  
    @cabuser = Cab.where(driver_id: current_user.driver.id).pluck(:id)
    @cabrequest = CabUser.where(cab_id: @cabuser)
  end

  def customer_request_approve
     # byebug
    a=CabUser.where("cab_id = ? AND user_id = ?",params[:cab_id],params[:customer_id]).last
     a.update(status: 'approved')
     CabuserMailer.with(cabuser: a).new_cabuser_email.deliver_now
    flash[:notice] = "Application has been approved"
    redirect_to 'show_request_path'
  end

  def edit
    @driver_request = DriverRequest.find(params[:id])
  end

  def update
    if @driver_request.update(driver_params)
      redirect_to 'driver_request_path'
    else
      render :edit, status: :unprocessable_entity
    end
  end

# def create
#     @driver_request = DriverRequest.new(driver_params)

#     if @driver_request.save
#       DriverRequest.with(driver_request: @driver_request).new_driver_request_email.deliver_now

#       flash[:success] = "Thank you for your order! We'll get contact you soon!"
#       redirect_to admin_driver_requests_path
#     else
#       flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
#       render :new
#     end
#   end

  private
  def driver_params
    params.require(:driver_request).permit %i[name email driving_license registration_certificate insurence_of_driver]
  end
end