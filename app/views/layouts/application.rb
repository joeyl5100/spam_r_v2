# setting layout for pages and loading pages
# I don't think we need this file though...
<!DOCTYPE html>
<html>
  <head>
    <title><%= full_title(yield(:name)) %></title>
  </head>
  <body>
    <div class="container">
      <%= yield %>
    </div>
  </body>
</html>

<% unless flash.empty? %>
     <script type="text/javascript">
          <% flash.each do |f| %>
	      <% type = f[0].to_s.gsub('alert', 'error').gsub('notice', 'info') %>
	     	 toastr['<%= type %>']('<%= f[1] %>');
	   <% end %>
     </script>
<% end %>