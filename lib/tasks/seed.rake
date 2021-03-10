namespace :db do
  namespace :seed do
    desc "Just replant seeded Jesuits"
    task replant_jesuits: :environment do
      Jesuit.destroy_all
      ENV["load_jesuits"] = "true"
      Dir[File.join(Rails.root, 'db', 'seeds', '*jesuits.rb')].sort.each do |seed|
        load seed
      end
    end
  end
end
