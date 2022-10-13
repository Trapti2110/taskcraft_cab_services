# Preview all emails at http://localhost:3000/rails/mailers/driver_request_mailer
class DriverRequestMailerPreview < ActionMailer::Preview
   def new_driver_request_email
    # Set up a temporary order for the preview
    driver_request = DriverRequest.new(name: "Trapti Sharma", email: "sharmatrapti80@gmail.com", status: 0, message: "I want to place an order!")

    DriverRequest.with(driver_request: driver_request).new_driver_request_email
  end



# def confirmation_instructions
#         @user = User.last
#         @getUser = User.find(@user)
#         @token = @getUser.confirmation_token
#         Devise::Mailer.confirmation_instructions(@user, @token)
#     end

#     def reset_password_instructions
#         @user = User.last
#         @getUser = User.find(@user)
#         @token = @getUser.reset_password_token
#         Devise::Mailer.reset_password_instructions(@user,@token)
#       end
# end