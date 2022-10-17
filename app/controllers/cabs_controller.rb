class CabsController < ApplicationController
  def index
    #byebug
    @cab = Cab.all

    # me = current_user         # shows current user which is signed in.
    # c = Cab.find(me)
    # @cab = c.time_cabs
  end
  
  def new
    # byebug
    @cab = Cab.new
  end

  def show
      # byebug
    @cab = Cab.find(params[:id])
  end

	def create
    # byebug
    @cab = Cab.create(cab_name: params['cab']['cab_name'],
      cab_route: params['cab']['cab_route'], cab_number: params['cab']['cab_number'],
      driver_id: current_user.driver.id)
    if @cab.save

      flash[:success] = "Thanks! I'll be in touch soon!"
      # redirect_to admin_user_path
      redirect_to cab_path(@cab)
     # else
     #  redirect_to 'new_cab_path'
    end
	end

  def edit
    @cab = Cab.find(params[:id])
  end

  def update
    @cab = Cab.find(params[:id])

    if @cab.update(cab_params)
      redirect_to cab_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def loged_in_driver_cab
     # byebug
    a = current_user.driver
    @cab = a.cabs
    # redirect_to loged_in_driver_cabs_path 
  end

  def destroy
    @cab = Cab.find(params[:id])
    @cab.destroy

    # redirect_to cabs_path, status: :see_other
  end

	private
  def cab_params
      params.require(:cab).permit(:cab_name, :cab_route, :cab_number, :driver_id)
  end
end
