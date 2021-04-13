class PlacesGrid
    include Datagrid

    scope do
        Place.order(:label)
    end

    filter(:label, :string) { |value| where("label ilike ?", "%#{value}%") }

    column(:label, :mandatory => true)
    column(:latitude, :mandatory => true, :order => false)
    column(:longitude, :mandatory => true, :order => false)
    column(:description, :mandatory => true, :order => false)

    column(:actions, :html => true, :mandatory => true) do | place |
        render :partial => "datagrid/actions", :locals => {:record => place, :model => Place}
    end
    
end