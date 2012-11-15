ActiveAdmin.register Flat, :namespace => "datacenter" do
  menu :priority => 3
  form :partial => 'form'
  index do
    selectable_column
    column :name
    column :building
    column "Locality" do |flat|
      flat.building.locality.name
    end
    column "Area" do |flat|
      flat.building.locality.area.name
    end
    column :bhk_config
    column "Flat Amenities", :tag_list
    column "Building Facilities" do |flat|
      flat.building.tag_list
    end
    default_actions
  end
  filter :building_locality_area_name, :label => "Area", :as => :string
  filter :building_locality_name, :label => "Locality", :as => :string
  filter :building
  filter :name
  filter :bhk_config, :label => "Configuration", :as => :check_boxes
  filter :building_taggings_tag_name, :label => "Building Facilities", :as => :check_boxes,
         :collection => proc { ActsAsTaggableOn::Tag.where('focus=="building"').all.map { |t| [t.name, t.name] } }
  filter :taggings_tag_name, :label => "Flat Amenities", :as => :check_boxes,
         :collection => proc { ActsAsTaggableOn::Tag.where('focus=="flat"').all.map { |t| [t.name, t.name] } }
end
