class DriverRequestMailer < ApplicationMailer

    def new_driver_request_email
        @driver_request = params[:driver_request]
        mail(to: @driver_request.email, subject: "You got a new driver_request!")
    end
end
