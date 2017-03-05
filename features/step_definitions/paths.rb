module NavigationHelpers
    def path_to(page_name)
        case page_name
        
        when /Home/
            root_path
        when /Login/
            new_user_session_path
        when /Register/
            new_user_registration_path
        else
            raise "Can't find mapping from \"#{page_name}\" to a path.\n"
        end
    end
end

World(NavigationHelpers)