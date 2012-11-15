ActiveAdmin.register Building, :namespace => "datacenter" do
  menu :priority => 2
  form :partial => 'form'
  index do
    selectable_column
    column :name
    column :locality
    column :building_quality
    column :approach_quality
    column :tag_list
    default_actions
  end
  filter :name
  filter :locality
  filter :building_quality
  filter :approach_quality
  filter :taggings_tag_name, :label => "Tags", :as => :check_boxes,
           :collection => proc {  ActsAsTaggableOn::Tag.where('focus=="building"').all.map{|t| [t.name, t.name]} }
end
