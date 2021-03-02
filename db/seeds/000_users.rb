case Rails.env
when "development"
  User.create({
                email: 'user1@example.com',
                password: 'password',
                password_confirmation: 'password'
              })
end