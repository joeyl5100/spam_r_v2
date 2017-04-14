require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.in '10s' do
  UserMailer.getMail     
  puts 'Test'
end