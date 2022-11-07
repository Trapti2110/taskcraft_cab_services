class CabuserMailer < ApplicationMailer
  def new_cabuser_email
    @cabuser = params[:cabuser]
    mail(to: @cabuser.user.email, subject: "Request has been approved!")
  end
end
