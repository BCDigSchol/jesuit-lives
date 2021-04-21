module CsvReader
  require "csv_reader/fields"
  require "csv_reader/preset_values"
  require "csv"
  require "date_point_factory"

  # Read a CSV file and populate the database
  #
  # @param [String] file the full path to the CSV file to read
  # @param [Boolean] show_progress show a CLI progress bar?
  def self.read(file, show_progress: false, index_batch_size: 100)

    solr_indexer = SolrIndexer::Indexer.new(batch_size: index_batch_size)

    preset_values = PresetValues.new

    item_count = 0
    start = Time.now
    total_lines = CSV.read(file, headers: true, liberal_parsing: true).length
    puts "Total rows in import file: #{total_lines}"

    bar = show_progress ? ProgressBar.new(total_lines) : NullProgressBar

    CSV.foreach(file, headers: true, encoding: Encoding::UTF_8, liberal_parsing: true) do |row|
      item_count += 1
      import_logger.info("Parsing row ##{item_count}")
      jesuit = build_jesuit_from_csv(row, bar, preset_values)
      solr_indexer.add(jesuit) if jesuit
    end

    # Commit any remaining Jesuits to solr.
    solr_indexer.commit

    diff = Time.now - start
    puts "Created #{item_count} records in #{diff} seconds\n\n"
    import_logger.info("Created #{item_count} records in #{diff} seconds")
  end

  # Build a Jesuit from a single CSV row
  #
  # @param [Array] row row from CSV
  # @param [#increment!] bar a progress bar
  # @param [PresetValues] preset_values
  def self.build_jesuit_from_csv(row, bar, preset_values)

    # Abort early if there's already a Jesuit with this ID
    # @todo log duplicates
    if Jesuit.exists?(:jl_id => row[Fields::JLIVES_ID])
      import_logger.info("  Found duplicate id! #{row[Fields::JLIVES_ID]}")
      return nil
    end

    jesuit = Jesuit.new

    jesuit.linking_id = row[Fields::LINKING_ID]
    jesuit.jl_id = row[Fields::JLIVES_ID]

    jesuit.last_name = row[Fields::LAST_NAME]
    jesuit.add_last_name_info = row[Fields::ADD_LAST_NAME_INFO]
    jesuit.alt_last_name = row[Fields::ALT_LAST_NAME]

    jesuit.first_name_abbrev = row[Fields::FIRST_NAME_ABBREV]
    jesuit.first_name = row[Fields::FULL_FIRST_NAME]
    jesuit.add_first_name_info = row[Fields::ADD_FIRST_NAME_INFO]
    jesuit.alt_first_name = row[Fields::ALT_FIRST_NAME]

    jesuit.birth_date = build_date(row, Fields::BIRTH_DATE)
    jesuit.add_birth_date_info = row[Fields::ADD_BIRTH_DATE_INFO]
    jesuit.alt_birth_date = build_date(row, Fields::ALT_BIRTH_DATE)

    jesuit.vow_date = build_date(row, Fields::VOW_DATE)
    jesuit.add_final_vow_date_info = row[Fields::ADD_FINAL_VOW_DATE_INFO]
    jesuit.alt_final_vow_date = build_date(row, Fields::ALT_FINAL_VOW_DATE)

    jesuit.ordination_date = build_date(row, Fields::ORDINATION_DATE)

    jesuit.death_date = build_date(row, Fields::DEATH_DATE)
    jesuit.add_death_date_info = row[Fields::ADD_DEATH_DATE_INFO]
    jesuit.alt_death_date = build_date(row, Fields::ALT_DEATH_DATE)

    jesuit.entrance_date = build_date(row, Fields::ENTRANCE_DATE_1)
    jesuit.entrance_date_2 = build_date(row, Fields::ENTRANCE_DATE_2)
    jesuit.add_entrance_date_i1_info = row[Fields::ADD_ENTRANCE_DATE_I1_INFO]
    jesuit.add_entrance_date_i2_info = row[Fields::ADD_ENTRANCE_DATE_I2_INFO]
    jesuit.alt_entrance_date_i1 = build_date(row, Fields::ALT_ENTRANCE_DATE_I1)
    jesuit.alt_entrance_date_i2 = build_date(row, Fields::ALT_ENTRANCE_DATE_I2)

    jesuit.place_of_birth = build_place(row, Fields::PLACE_OF_BIRTH)
    jesuit.add_place_of_birth_info = row[Fields::ADD_PLACE_OF_BIRTH_INFO]
    jesuit.alt_place_of_birth = build_place(row, Fields::ALT_PLACE_OF_BIRTH)

    jesuit.place_of_death = build_place(row, Fields::PLACE_OF_DEATH)
    jesuit.add_place_of_death_info = row[Fields::ADD_PLACE_OF_DEATH_INFO]
    jesuit.alt_place_of_death = build_place(row, Fields::ALT_PLACE_OF_DEATH)

    jesuit.entrance_province = build_province(row, Fields::ENTRANCE_PROVINCE)
    jesuit.add_entrance_place_info_i1 = row[Fields::ADD_ENTRANCE_PLACE_INFO_I1]
    jesuit.entrance_province_2 = build_province(row, Fields::ENTRANCE_PROVINCE_2)
    jesuit.add_entrance_place_info_i2 = row[Fields::ADD_ENTRANCE_PLACE_INFO_I2]

    if preset_values.title(row[Fields::TITLE])
      jesuit.title = preset_values.title(row[Fields::TITLE])
    else
      jesuit.title = Title.find_or_create_by(abbreviation: row[Fields::TITLE])
    end

    if preset_values.title(row[Fields::STATUS])
      jesuit.status = preset_values.status(row[Fields::STATUS])
    else
      jesuit.status = Status.find_or_create_by(abbreviation: row[Fields::STATUS])
    end
    jesuit.add_status_info = row[Fields::ADD_STATUS_INFO]

    begin
      jesuit.save(validate: false)
    rescue
      import_logger.info("Error saving jesuit record #{jesuit.jl_id} with name '#{jesuit.last_name}, #{jesuit.first_name}'")
      import_logger.info("Error message: #{$!.to_s}")
    end

    import_logger.info("  Jesuit record saved")
    import_logger.info("  jl_id: #{jesuit.jl_id}")
    import_logger.info("  last_name: #{jesuit.last_name}")
    import_logger.info("  first_name_abbrev: #{jesuit.first_name_abbrev}")
    import_logger.info("  first_name: #{jesuit.first_name}")
    import_logger.info("  full_name: #{jesuit.full_name}")
    if jesuit.death_date
      import_logger.info("  death_date: #{jesuit.death_date.date}")
    end
    if jesuit.vow_date
      import_logger.info("  vow_date: #{jesuit.vow_date.date}")
    end
    if jesuit.entrance_date
      import_logger.info("  entrance_date: #{jesuit.entrance_date.date}")
    end
    if jesuit.entrance_date_2
      import_logger.info("  entrance_date_2: #{jesuit.entrance_date_2.date}")
    end
    if jesuit.place_of_birth
      import_logger.info("  place_of_birth: #{jesuit.place_of_birth.label}")
    end
    if jesuit.place_of_death
      import_logger.info("  place_of_death: #{jesuit.place_of_death.label}")
    end
    if jesuit.entrance_province
      import_logger.info("  entrance_province: #{jesuit.entrance_province.abbreviation}")
    end
    if jesuit.title
      import_logger.info("  title: #{jesuit.title.abbreviation}")
    end
    if jesuit.status
      import_logger.info("  status: #{jesuit.status.abbreviation}")
    end

    bar.increment!
    jesuit
  end

  # Build a DatePoint from a CSV file entry
  # @param [Array<String>] row
  # @param [Integer] field
  def self.build_date(row, field)

    return nil if row[field] === nil

    date = nil
    begin
      date = DatePointFactory::build(row[field])
    rescue Date::Error => e
      # @todo log bad dates
    end
    date
  end

  # Build a Place from a CSV file entry
  # @param [Array<String>] row
  # @param [Integer] field
  def self.build_place(row, field)
    # Don't build a place if there is nothing to build.
    return nil unless row[field]

    Place.find_or_create_by(label: row[field])
  end

  # Build a Province from a CSV file entry
  # @param [Array<String>] row
  # @param [Integer] field
  def self.build_province(row, field)
    # Don't build a province if there is nothing to build.
    return nil unless row[field]

    Province.find_or_create_by(label: row[field])
  end

  # Null class for progress bar, so we don't have to check for existence on every tick.
  class NullProgressBar
    def increment!
      # No-op
    end
  end

end