require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  mailer = UserMailer.new
  mailer.getMail     
  puts 'Test'
end