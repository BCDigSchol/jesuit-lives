module CsvReader
  class PresetValues
    def initialize
      @titles = {}
      @statuses = {}

      Title.all.each do |title|
        @titles[title.abbreviation] = title
      end

      Status.all.each do |status|
        @statuses[status.abbreviation] = status
      end
    end

    def title(abbreviation)
      @titles.key?(abbreviation) ? @titles[abbreviation] : nil
    end

    def status(abbreviation)
      @statuses.key?(abbreviation) ? @statuses[abbreviation] : nil
    end
  end
end