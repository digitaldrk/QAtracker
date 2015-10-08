namespace :reporting_mailer do
  desc "This is to send an email to users"
  task mail_report: :environment do
    ReportingMailer.two_week_email(User.first).deliver!
  end
end