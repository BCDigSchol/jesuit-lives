class JesuitsGrid
    include Datagrid

    scope do
        Jesuit.order(:last_name)
    end

    # fill out more filters and columns once model is updated
    filter(:last_name, :string) { |value| where("last_name ilike ?", "%#{value}%") }

    column(:label, :mandatory => true)

    column(:actions, :html => true, :mandatory => true) do | jesuit |
        render :partial => "datagrid/actions", :locals => {:record => jesuit, :model => Jesuit}
    end
    
end