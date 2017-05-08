module NavigationHelpers
    def path_to(page_name)
        case page_name
        
        when /Home/
            root_path
        when /Login/
            new_user_session_path
        when /Register/
            new_user_registration_path
        when /Messages/
            messages_url
        when /Resend Confirmation/

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
        when /Show/
            messages_url << "1"
        when /Second/
            messages_url << "?page=2"
        when /First/
            messages_url << "?page=1"
        when /Most Recent Message/
            messages_url << "/15"
        when /Faulty Tag/
            messages_url << "?tag=aoesunth.nstphsnt.,hpnstabeusneotasntuhsnaeou"
        when /Example1 Search/   
            messages_url << "?utf8=✓&q%5Bauthor_cont%5D=example1&q%5Bsubject_cont%5D=&q%5Bcontent_cont%5D=&commit=Search"
        when /Example One Search/   
            messages_url << "?q%5Bauthor_cont%5D=example1&q%5Bsubject_cont%5D=&q%5Bcontent_cont%5D=&q%5Bcreated_at_gteq%5D=&q%5Bcreated_at_lteq%5D=&commit=Search"
        when /Example Two Search/   
            messages_url << "?q%5Bauthor_cont%5D=&q%5Bsubject_cont%5D=Example2&q%5Bcontent_cont%5D=&q%5Bcreated_at_gteq%5D=&q%5Bcreated_at_lteq%5D=&commit=Search"
        when /Example Three Search/
            messages_url << "?q%5Bauthor_cont%5D=&q%5Bsubject_cont%5D=&q%5Bcontent_cont%5D=Content3&q%5Bcreated_at_gteq%5D=&q%5Bcreated_at_lteq%5D=&commit=Search"
        else
            raise "Can't find mapping from \"#{page_name}\" to a path.\n"
        end
    end
end

World(NavigationHelpers)