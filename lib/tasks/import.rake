namespace :jlives do

  def import_logger
    @import_logger ||= Logger.new("#{Rails.root}/log/import_jesuits.log")
  end

  desc "Import Jesuits from CSV"
  task import_jesuits: :environment do

    if user_prompt_interactive?
      Rake::Task["jlives:clear_jesuits_noninteractive"].invoke
      Rake::Task["jlives:import_jesuits_noninteractive"].invoke
    end
  end

  desc "Import Jesuits from small CSV"
  task import_jesuits_small: :environment do

    if user_prompt_interactive?
      Rake::Task["jlives:clear_jesuits_noninteractive"].invoke
      Rake::Task["jlives:import_jesuits_small_noninteractive"].invoke
    end
  end

  desc "Import Jesuits (non-interactive)"
  task import_jesuits_noninteractive: :environment do
    require "csv_reader"
    file = select_import_home_path + 'jesuit-lives-clean.csv'
    import_logger.info("Starting Jesuits import - reading from file #{file}")
    CsvReader.read(file, show_progress: true)
  end

  desc "Import Jesuits (non-interactive)"
  task import_jesuits_small_noninteractive: :environment do
    require "csv_reader"
    file = select_import_home_path + 'jesuit-lives-clean-small.csv'
    import_logger.info("Starting Jesuits import - reading from file #{file}")
    CsvReader.read(file, show_progress: true)
  end

  desc "Clear Jesuit records and DatePoints"
  task clear_jesuits_noninteractive: :environment do
    puts "Clearing existing Jesuit records and DatePoints"
    import_logger.info("Clearing existing Jesuit records and DatePoints")
    bar = ProgressBar.new(2)
    Jesuit.destroy_all
    bar.increment!
    DatePoint.destroy_all
    bar.increment!
    puts "Task completed.\n\n"
  end

end

# look at the RAILS_ENV variable and select the appropriate import file location
def select_import_home_path
  # default path for RAILS_ENV=development
  path = Rails.root.join("db", "imports")

  rails_env = ENV['RAILS_ENV'] || nil

  # check if RAILS_ENV is set
  if rails_env.nil?
    puts "\n\nRAILS_ENV is not set in this shell. Defaulting to 'production'.\n\n"
  end

  puts "Found RAILS_ENV=#{rails_env}"

  # if this is the production server then look for the import files
  # in the rails user's home directory
  if rails_env == "production"
    path = "#{Dir.home}/imports/"
  end

  puts "Using import file path: '#{path}'"

  path
end

# run interactive prompt to force user to acknowledge running this command
def user_prompt_interactive?
  STDOUT.puts "This task will alter the database. Are you sure you want to continue? (y/n)"
  input = STDIN.gets.strip
  input == 'y'
end