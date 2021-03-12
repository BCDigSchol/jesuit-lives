module DatePointFactory

  # Build a DatePoint from a date string
  #
  # @param [String] date_string e.g. "05-03-1807", "dd-03-1807"
  # @return [DatePoint]
  def self.build(date_string)
    date_point = DatePoint.new

    date_string.strip!

    # Store the date as entered.
    date_point.text = date_string

    # If the date string does not meet the appropriate format, return the
    # DatePoint containing just the text value.
    return date_point unless date_string.match?(/(\d\d|dd)-(\d\d|mm)-(\d\d\d\d|yyyy)/)

    day, month, year = date_string.split('-')

    # If we don't know the year we might as well not assign a date.
    return date_point if year == 'yyyy'

    # Determine precision. Default to day, and broaden if we can't
    # find the month or day values.
    date_point.precision = DatePoint.precisions[:day]
    if day == 'dd'
      date_point.precision = DatePoint.precisions[:month]
      day = '01'
    end
    if month == 'mm'
      date_point.precision = DatePoint.precisions[:year]
      month = '01'
    end

    # Build a date object
    formatted_date_string = [day, month, year].join('-')
    date_point.date = Date.parse(formatted_date_string)

    date_point
  end

end