require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

#Grab mail from gmail every hour
scheduler.every '1h' do
  mailer = UserMailer.new
  mailer.getMail     
end