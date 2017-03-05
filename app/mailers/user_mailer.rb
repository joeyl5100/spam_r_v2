class UserMailer < ApplicationMailer
require 'mail'

Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'csc322emailarchive',
                          :password   => 'password12345',
                          :enable_ssl => true
end
end
