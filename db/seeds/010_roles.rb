case Rails.env
when "development"
    Role.find_or_create_by(name: 'admin') do | role |
        role.description = 'Admin level account. Can access everything.'
    end

    Role.find_or_create_by(name: 'supervisor') do | role |
        role.description = 'Supervisor level account. Can manage static pages, and edit records.'
    end

    Role.find_or_create_by(name: 'editor') do | role |
        role.description = 'Editor level account. Can edit records.'
    end

    Role.find_or_create_by(name: 'noaccess') do | role |
        role.description = 'No access level account. Can not access any backend services.'
    end
end