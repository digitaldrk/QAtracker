namespace :reporting_mailer do
  desc "This is to send an email to users"
  task mail_report: :environment do
    if Time.now.friday?
      User.find_each do |user|
        ReportingMailer.two_week_email(user).deliver
      end
    end
  end
end