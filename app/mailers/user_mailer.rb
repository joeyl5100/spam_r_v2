class UserMailer < ApplicationMailer
require 'mail'

Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'csc322emailarchive',
                          :password   => 'password12345',
                          :enable_ssl => true
end
#Mail.first
#grab first email

#Mail.all
#grab all email


# /\n-->.*--_000/m.match(Nokogiri::HTML(text.body.decoded).text)
# regex expression to parse email body


#  trimmedText = text[0].split('')[8, text[0].length - 19].join
# How to cut off front and back of regex

# for loop to grab info from each file
#id = 0
#Mail.all.each do |mail|
#  message = Message.new
#  message.id = id
#  message.subject = mail.subject
#  message.author = mail.from
#  message.content = mail.getContent(mail)
#  message.created_at = mail.date.to_s
#  message.updated_at = Time.now.strftime("%Y-%m-%d %H:%M")
#  message.save
#  id += 1

# quick test  
#  puts message.id
#  puts message.author
#  puts message.subject
#  puts message.content
#  puts message.created_at
#  puts message.updated_at
  
#end


# helper method to extract body
#def getContent(mail)
#  nokogiriMail = /\n-->.*--_000/m.match(Nokogiri::HTML(mail.body.decoded).text)
#  trimmedText = nokogiriMail[0].split('')[8, nokogiriMail[0].length - 20].join
#  return trimmedText
#end

end
