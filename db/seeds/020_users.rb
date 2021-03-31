case Rails.env
when "development"
  admin_role = Role.find_by_name('admin')
  supervisor_role = Role.find_by_name('supervisor')
  editor_role = Role.find_by_name('editor')
  noaccess_role = Role.find_by_name('noaccess')

  User.find_or_create_by(email: 'admin@test.com') do | user |
    user.password = 'password'
    user.password_confirmation = 'password'
    user.name = 'Jimmy Admin'
    user.role = admin_role
  end
  
  User.find_or_create_by(email: 'supervisor1@test.com') do | user |
    user.password = 'password'
    user.password_confirmation = 'password'
    user.name = 'Jane Supervisor'
    user.role = supervisor_role
  end

  User.find_or_create_by(email: 'supervisor2@test.com') do | user |
    user.password = 'password'
    user.password_confirmation = 'password'
    user.name = 'Julio Supervisor'
    user.role = supervisor_role
  end

  User.find_or_create_by(email: 'editor@test.com') do | user |
    user.password = 'password'
    user.password_confirmation = 'password'
    user.name = 'Nancy Editor'
    user.role = editor_role
  end

  User.find_or_create_by(email: 'noaccess@test.com') do | user |
    user.password = 'password'
    user.password_confirmation = 'password'
    user.name = 'Noah Noaccess'
    user.role = noaccess_role
  end
              
end