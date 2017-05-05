class MyMailer < Devise::Mailer   
# This gives access to all helpers defined within `application_helper`.
  helper :application 
# Optional. eg. `confirmation_url`
  include Devise::Controllers::UrlHelpers 
# This is to make sure that your mailer uses the devise views
  default template_path: 'devise/mailer' 
# This is for sending a confirmation message to a new user
def confirmation_instructions(record, token, opts={})
  headers["Custom_header"] = "Email Archive Email Confirmation"
  opts[:from] = 'csc322emailarchive@gmail.com' 
  #opts[:reply_to] = 'csc322emailarchive@gmail.com'
  super
end

end