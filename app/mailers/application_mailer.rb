class ApplicationMailer < ActionMailer::Base
  default from: ENV['DEFAULT_EMAIL_FROM'] || 'from@example.com'
  layout 'mailer'
end