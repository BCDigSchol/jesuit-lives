class ProvincesGrid
    include Datagrid

    scope do
        Province.order(:abbreviation)
    end

    filter(:label, :string) { |value| where("abbreviation ilike ?", "%#{value}%") }

    column(:abbreviation, :mandatory => true)
    column(:label, :mandatory => true, :order => false)
    column(:unabridged, :mandatory => true, :order => false)
    column(:description, :mandatory => true, :order => false)

    column(:actions, :html => true, :mandatory => true) do | province |
        render :partial => "datagrid/actions", :locals => {:record => province, :model => Province}
    end
    
end