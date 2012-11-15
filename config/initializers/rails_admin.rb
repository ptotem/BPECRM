# RailsAdmin config file. Generated on November 09, 2012 15:39
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Brokers Please Excuse', 'Intranet']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin_user } # auto-generated

  # Include specific models:
  #config.included_models = ["Area", "Building", "Contact", "Flat", "Locality", "User"]

  config.actions do
    # root actions
    dashboard # mandatory

    # collection actions
    index # mandatory
    new
    export
    import
    history_index
    bulk_delete

    # member actions
    show
    edit
    delete
    history_show
    show_in_app
  end

  config.models do
    edit do
      fields_of_type :tag_list do
        partial 'tag_suggestions'
      end
    end
  end

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Include specific models (exclude the others):
  # config.included_models = []

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:

  RailsAdminImport.config do |config|
    config.model Building do
      excluded_fields do
        [:building_quality,:approach_quality,:tagging, :base_tag, :tag_tagging, :tag, :building_tag_tagging, :building_tag]
      end
    end
    config.model Flat do
      excluded_fields do
        [:interiors_quality,:flat_photos, :view_quality, :key, :tagging, :base_tag, :tag_tagging, :tag, :flat_tag_tagging, :flat_tag, :flat_contact, :showing, :flat_photo, :floorplan_file_name, :floorplan_content_type,:floorplan_file_size,:floorplan_updated_at, :floorplan]
      end
    end
    config.model Contact do
      excluded_fields do
        [:tagging, :base_tag, :tag_tagging, :tag, :contact_tag_tagging, :contact_tag, :flat_contact, :connection]
      end
    end
  end

end
