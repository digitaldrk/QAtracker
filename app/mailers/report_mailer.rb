class ReportMailer < ActionMailer::Base
  
  # Each method makes a view that makes an email
  def two_week(user)

    mail(to: user.email,
         from: "ronburgundy@gmail.com",
         subject: "Here is your bi-weekly 4DX report!",
         body: "Looking forward to getting something besides static text in here"
    )

  end

end