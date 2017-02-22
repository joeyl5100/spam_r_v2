Given / following users exist / do |users_table|
   users_table.each do |user|
      User.create!(user) #User is model name, user is a row in users_table, .create is from controller
   end
end