case Rails.env
when "development"
    Role.find_or_create_by(name: 'admin') do | admin |
        admin.description = 'Admin level account. Can access everything.'
    end

    Role.find_or_create_by(name: 'supervisor') do | supervisor |
        supervisor.description = 'Supervisor level account. Can manage static pages, and edit records.'
    end

    Role.find_or_create_by(name: 'editor') do | editor |
        editor.description = 'Editor level account. Can edit records.'
    end
end