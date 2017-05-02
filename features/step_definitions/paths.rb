module NavigationHelpers
    def path_to(page_name)
        case page_name
        
        when /Home/
            root_path
        when /Login/
            new_user_session_path
        when /Register/
            new_user_registration_path
        when /Resend Confirmation/
            #root_path + /users/confirmation/new
            #new_user_confirmation #may need to change
        when /Talk Search/
            messages_url << "?tag=Talk"
        when /CS Table Search/
            messages_url << "?tag=CS%20Table"
        when /Internship Search/
            messages_url << "?tag=Internship"
        when /Job Search/
            messages_url << "?tag=Job"
        when /Off Campus Search/
            messages_url << "?tag=Off%20Campus"
        when /Candidate Search/
            messages_url << "?tag=Candidate"
        when /Misc Search/
            messages_url << "?tag=Misc."
         when /Example1 Search/   
            messages_url << "?utf8=✓&q%5Bauthor_cont%5D=example1&q%5Bsubject_cont%5D=&q%5Bcontent_cont%5D=&commit=Search"
        else
            raise "Can't find mapping from \"#{page_name}\" to a path.\n"
        end
    end
end

World(NavigationHelpers)