ActiveAdmin.register Contact, :namespace => "datacenter" do
  menu :priority => 4
  index do
    selectable_column
    column :name
    column :phone
    column :email
    column :tag_list
    default_actions
  end
  filter :name
  filter :phone
  filter :email
  filter :taggings_tag_name, :label => "Tags", :as => :check_boxes,
         :collection => proc { ActsAsTaggableOn::Tag.where('focus=="contact"').all.map { |t| [t.name, t.name] } }
end
