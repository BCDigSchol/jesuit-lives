namespace :jlives do

  desc "Destroy all records"
  task clear_all_noninteractive: :environment do
    puts "Clearing all existing Bib records..."
    Jesuit.destroy_all
    DatePoint.destroy_all
    Place.destroy_all
    Province.destroy_all
    Status.destroy_all
    Title.destroy_all
    puts "Task completed.\n\n"
  end

  desc "Read CSV and import"
  task "c"

end
