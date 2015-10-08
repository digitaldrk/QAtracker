class ReportingMailer < ApplicationMailer
  default from: 'reports@fourdx.herokuapp.com'

  def two_week_email(user)
    @user = user
    mail(to: @user.email, subject: 'Here is your bi-monthly report')
  end
end
