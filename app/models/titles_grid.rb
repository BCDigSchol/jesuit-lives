class TitlesGrid
    include Datagrid

    scope do
        Title.order(:label)
    end

    filter(:label, :string) { |value| where("label ilike ?", "%#{value}%") }
    filter(:unabridged, :string) { |value| where("unabridged ilike ?", "%#{value}%") }

    column(:abbreviation, :mandatory => true, :order => false)
    column(:label, :mandatory => true)
    column(:unabridged, :mandatory => true)
    column(:description, :mandatory => true, :order => false)

    column(:actions, :html => true, :mandatory => true) do | title |
        render :partial => "datagrid/actions", :locals => {:record => title, :model => Title}
    end
    
end