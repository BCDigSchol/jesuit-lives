# Represents a date at various levels of precisions
#
# Dates in Jesuit Lives can have different levels of precision:
#
#    05-03-1807 - an exact day
#    dd-03-1807 - a month, day unknown
#    dd-mm-1807 - a year, date and month unknown
#
# To reflect these levels of precision while still maintaining different levels
# of precision, DatePoints have a traditional ActiveRecord Date as well as a
# precision indicator.
class DatePoint < ApplicationRecord
  enum precisions: { day: 'day', month: 'month', year: 'year' }
  validates :precisions, inclusion: { in: precisions.keys }

  def display_date
    date_string = self.date.strftime('%d-%m-%Y')

    # @todo Make just year/just month dates come out good.
  end

  def solr_date
    self.date.strftime('%Y-%m-%dT00:00:01Z')
  end

  # Build a DatePoint from a date string
  #
  # @param [String] date_string e.g. "05-03-1807", "dd-03-1807"
  # @return [DatePoint]
  def self.build(date_string)
    date_point = DatePoint.new

    date_parts = date_string.split('-')
    raise new InvalidDateStringError("#{date_parts} is not in format ##-##-####") unless date_parts.length == 3

    # Abort if there is no date at all
    return nil if date_parts[2] == 'yyyy'

    # Determine precision
    if date_parts[1] == 'dd'
      date_point.precision = precisions[:year]
      date_parts[0] = '01'
      date_point[1] = '01'
    elsif date_parts[0] == 'mm'
      date_point.precision = precisions[:month]
      date_parts[0] = '01'
    else
      date_point.precision = precisions[:day]
    end

    formatted_date_string = date_parts.join('-')

    date_point.date = Date.parse(formatted_date_string)

    date_point
  end

  class InvalidDateStringError < StandardError
  end
end
