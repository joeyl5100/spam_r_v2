ActiveAdmin.register Message do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

# Chahnges index page
 index do
  column :author
  column :subject
  column :content
  column :tag_list
  column :created_at
  column :updated_at
  actions
 end
 

#customize new/edit pages 
form do |f|
 f.inputs  # existing content
 f.input :tag_list # this will display the tag list column
 actions
end

#changes message show page
 show do
  attributes_table do
   row :author
   row :subject
   row :content
   row :tag_list
   row :created_at
   row :updated_at
  end
  active_admin_comments
 end
 
#remove tag redundant filter 
preserve_default_filters!
remove_filter :taggings
remove_filter :base_tags
remove_filter :tag_taggings
 
 
#Allows editting and deleting messages 
 controller do
    def permitted_params
      params.permit message: [:author, :subject, :content, :tag_list, :created_at, :updated_at]
    end
  end

end
