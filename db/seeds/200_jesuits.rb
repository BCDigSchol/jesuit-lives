case Rails.env
when "development"
  # Only load sample Jesuits if "load_jesuits" environmental variable is set,
  # e.g.
  #
  #     bundle exec rake db:seed load_jesuits=yes
  if ENV["load_jesuits"]
=begin
    include DatePointFactory

    title_priest = Title.find_by_abbreviation('p')

    Jesuit.create([
                    {
                      jl_id: '0.001',
                      title: title_priest,
                      last_name: 'Osmłowski',
                      first_name_abbrev: 'Ioac',
                      first_name: 'Ioachim',
                      entrance_province: Province.find_by_abbreviation('in Imp Russ'),
                      status: Status.find_by_abbreviation('nov'),
                      death_date: DatePointFactory.build('17-09-1814')
                    },
                    {
                      jl_id: '0.085',
                      title: title_priest,
                      last_name: 'Castañiza',
                      first_name_abbrev: 'Ios.',
                      first_name: 'Iosephus',
                      birth_date: DatePointFactory.build('23-05-1744'),
                      place_of_birth: Place.find_by_label('México'),
                      entrance_date: DatePointFactory.build('18-03-1761'),
                      entrance_province: Province.find_by_abbreviation('Mex'),
                      status: Status.find_by_abbreviation('p3'),
                      death_date: DatePointFactory.build('24-11-1816')
                    }
                  ])
=end
  end
end