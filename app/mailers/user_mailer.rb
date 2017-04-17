class UserMailer < ApplicationMailer
  
  require 'mail'

  #Connect to gmail account
  Mail.defaults do
    retriever_method :pop3, :address    => "pop.gmail.com",
                            :port       => 995,
                            :user_name  => 'csc322emailarchive',
                            :password   => 'password12345',
                            :enable_ssl => true
  end

  # method to grab mail info from each file
  def getMail
    id = Message.count
    allMail = Mail.all #Grab all unread mail
    if !allMail.empty? #Check to see if no new mail
      allMail.each do |mail|
        #check to see if author is from grinnell domain
        if mail.from[0].include? ("@grinnell.edu")
          message = Message.new
          message.id = id
          message.subject = mail.subject
          message.author = mail.from[0]
          message.content = getContent(mail)
          message.created_at = mail.date.to_s
          message.updated_at = Time.now.strftime("%Y-%m-%d %H:%M")
          addTag(message)
          message.save
          id += 1
        end
      end
    end
  end
  
  # helper method to extract body from email sent by grinnell.edu account
  def getContent(mail)
    # regex expression to parse email body
    nokogiriMail = /\n-->.*--_000/m.match(Nokogiri::HTML(mail.body.decoded).text)
    noko = nokogiriMail[0]
    # How to cut off front and back of regex
    trimmedText = noko[8..noko.length - 12]
    
    #Converts some characters back to what they should be
    conversions = {'92' => '\'', '85' => '...', 'E9' => 'é'}
    trimmedText.gsub!(/=([0-9A-F]+)/) {|s| conversions[$1] }
    #Styling (remove newlines)
    trimmedText.squeeze!("\n")
    trimmedText.gsub!("=\n", "")
    trimmedText.gsub!("&nbsp;", "")
    return trimmedText
  end
  
  # Add tags using subject
  # Grabs text between {}
  def addTag(message)
    sub = message.subject.downcase
    tags = /[{].*[}]/.match(sub)
    if !tags.nil?
      tags = tags[0][1..tags[0].length-2]
      tagArr = tags.split(',')
      tagArr.each do |tag|
       if tag.include? "cs extra"
          message.tag_list.add("CS Extra")
        elsif tag.include? "cs table"
          message.tag_list.add("CS Table")
        elsif tag.include? "internship"
          message.tag_list.add("Internship")
        elsif tag.include? "job"
          message.tag_list.add("Job")
        else
          message.tag_list.add("Misc.")
        end
      end
    else
      message.tag_list.add("Misc.")
    end
  end

end