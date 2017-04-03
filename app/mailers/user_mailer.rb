class UserMailer < ApplicationMailer
require 'mail'

Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'csc322emailarchive',
                          :password   => 'password12345',
                          :enable_ssl => true
end

#Mail.defaults do
#  retriever_method :pop3, :address    => "pop.outlook.com",
#                          :port       => 995,
#                          :user_name  => 'grinnellcsstudentarchive@outlook.com',
#                          :password   => 'wRECKAGESURGICAL2',
#                          :enable_ssl => true
#end


# method to grab mail info from each file

def getMail()

  id = Message.count
  Mail.all.each do |mail|
    if(mail != []) #check to see if array is not empty
      message = Message.new
      message.id = id
      message.subject = mail.subject
      message.author = mail.from
      message.content = mail.getContent(mail)
      message.created_at = mail.date.to_s
      message.updated_at = Time.now.strftime("%Y-%m-%d %H:%M")
      addtag(message)
      message.save
      id += 1
    else
      puts "No emails in inbox"
    end
  end
end

# helper method to extract body from email sent by grinnell.edu account
def getContent(mail)
  # regex expression to parse email body
  nokogiriMail = /\n-->.*--_000/m.match(Nokogiri::HTML(mail.body.decoded).text)
  # How to cut off front and back of regex
  trimmedText = nokogiriMail[0][8..nokogiriMail[0].length - 12]
  conversions = {'92' => '\'', '85' => '...', 'E9' => 'é'}
  trimmedText.gsub!(/=([0-9A-F]+)/) {|s| conversions[$1] }
  return trimmedText
end

# subject: [CS Table, Internship] This is ...
def addtag(message)
  sub = message.subject.downcase
  tags = /[\[].*[\]]/.match(sub)
  tags = tags[0][1..tags[0].length-2]
  tagArr = tags.split(',')
  tagArr.each do |tag|
    if tag == "cs extra" || tag == "cs extras" || tag == "csextra" || tag == "csextras"
      message.tag_list.add("CS Extra")
    elsif tag == "cs table" || tag == "cstable"
      message.tag_list.add("CS Table")
    elsif tag == "internship"
      message.tag_list.add("Internship")
    elsif tag == "job"
      message.tag_list.add("Job")
    else
      message.tag_list.add("Misc.")
    end
  end
end


#def getContentGmail(mail)
#  str = mail.body.decoded
#  regexMail = /=UTF-8.*\n\n--/m.match(str[0..str.length/2])
#  trimmedText = regexMail[0][8..regexMail[0].length-6]
#  return trimmedText
#end