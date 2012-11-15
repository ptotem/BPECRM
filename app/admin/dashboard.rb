ActiveAdmin.register_page "Dashboard", :namespace => "datacenter" do

  menu :priority => 1, :label => proc { I18n.t("active_admin.dashboard") }

  content :title => proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Flats" do
          ul do
            Flat.last(5).map do |flat|
              li link_to("#{flat.name}, #{flat.building.name}", datacenter_flat_path(flat))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
