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
          #Grab subject that doesn't include csstudent and other tags
          message.subject = addTag(message, mail.subject).squeeze(" ")
          message.tag_list.sort!
          message.author = mail.from[0]
          message.content = getContent(mail)
          message.created_at = mail.date.to_s
          message.updated_at = Time.now.strftime("%Y-%m-%d %H:%M")
          saveAttachments(mail)
          message.save
          id += 1
        end
      end
    end
  end
  
  # remove csstudent and tags from the subject
  def trimSubject(subject)
    noTag = subject.sub(/[\[].*[\]]/, "").strip
    return noTag
  end
  
  def getContent(mail)
  #Converts some characters back to what they should be
    text = mail.text_part.body.decoded
    text.encode!("UTF-8", "Windows-1252")
  #remove excess newlines 
    text.squeeze!("\n")
    return text
  end
  
  # Add tags using subject
  # Grabs tags between brackets and trims the subject
  def addTag(message, mail)
    subject = mail.sub("[csstudents]", "")
    subjectLow = subject.downcase
    tags = /[\[].*[\]]/.match(subjectLow)
    if !tags.nil?
      tags = tags[0][1..-2]
      tagArr = tags.split('][')
      tagArr.each do |tag|
       if tag.include? "cs extra"
          message.tag_list.add("CS Extra")
        elsif tag.include? "cs table"
          message.tag_list.add("CS Table")
        elsif tag.include? "internship"
          message.tag_list.add("Internship")
        elsif tag.include? "job"
          message.tag_list.add("Job")
        elsif tag.include? "offcampus"
          message.tag_list.add("Off Campus")
        elsif tag.include? "candidate"
          message.tag_list.add("Candidate")
        else
          message.tag_list.add("Misc.")
        end
      end
    else
      message.tag_list.add("Misc.")
    end
    return subject.sub(/[\[].*[\]]/, "").strip
  end

def saveAttachments(mail)
  mail.attachments.each do | attachment |
    # Attachments is an AttachmentsList object containing a
    # number of Part objects
    filename = attachment.filename
    begin
      File.open(filename, "w+b", 0644) {|f| f.write attachment.body.decoded}
    rescue => e
      puts "Unable to save data for #{filename} because #{e.message}"
    end
  end
end

end