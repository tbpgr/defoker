# encoding: utf-8
require 'date_base_name'
require 'date'

module Defoker
  # rubocop disable LineLength
  DEFOKERFILE_PATH = 'Defokerfile'
  DEFOKERFILE_TEMPLATE = <<-EOS
# type is required. 
# you can choose type form...
# [:today | :tomorrow | :yesterday | :this_month | :next_month | :previous_month | :this_year | :previous_year | :next_month]
# example
# type :this_month
type :today
# base is optional.
# example
# base 'ruby'
base ''
  EOS

  # Defoker Core
  class Core
    # Generate Defokerfile template
    def init
      File.open(DEFOKERFILE_PATH, 'w:utf-8') { |f|f.puts DEFOKERFILE_TEMPLATE }
    end

    # Get today folder name
    #
    # @param [String] additional additional name
    # @return [String] today folder name
    def today(additional: '')
      DateBaseName.new.to_yyyymmdd(Date.today, additional: additional)
    end

    # Get tomorrow folder name
    #
    # @param [String] additional additional name
    # @return [String] tomorrow folder name
    def tomorrow(additional: '')
      DateBaseName.new.to_yyyymmdd(Date.today + 1, additional: additional)
    end

    # Get yesterday folder name
    #
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def yesterday(additional: '')
      DateBaseName.new.to_yyyymmdd(Date.today - 1, additional: additional)
    end

    # Get days folder name list
    #
    # @param [String] date yyyymmdd format string
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def days(date, count: 3, additional: '')
      date = Date.new(date[0..3].to_i, date[4..5].to_i, date[6..7].to_i)
      DateBaseName.new.to_yyyymmdd_list(date, count: count, additional: additional)
    end

    # Get this month folder name
    #
    # @param [String] additional additional name
    # @return [String] this month folder name
    def this_month(additional: '')
      DateBaseName.new.to_yyyymm(Date.today, additional: additional)
    end

    # Get next month folder name
    #
    # @param [String] additional additional name
    # @return [String] next month folder name
    def next_month(additional: '')
      DateBaseName.new.to_yyyymm(Date.today >> 1, additional: additional)
    end

    # Get previous month folder name
    #
    # @param [String] additional additional name
    # @return [String] previous month folder name
    def previous_month(additional: '')
      DateBaseName.new.to_yyyymm(Date.today << 1, additional: additional)
    end

    # Get months folder name list
    #
    # @param [String] month yyyymmdd format string
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def months(month, count: 3, additional: '')
      month = Date.new(month[0..3].to_i, month[4..5].to_i)
      DateBaseName.new.to_yyyymm_list(month, count: count, additional: additional)
    end

    # Get this year folder name
    #
    # @param [String] additional additional name
    # @return [String] this year folder name
    def this_year(additional: '')
      DateBaseName.new.to_yyyy(Date.today, additional: additional)
    end

    # Get next year folder name
    #
    # @param [String] additional additional name
    # @return [String] next year folder name
    def next_year(additional: '')
      DateBaseName.new.to_yyyy(Date.today >> 12, additional: additional)
    end

    # Get previous year folder name
    #
    # @param [String] additional additional name
    # @return [String] previous year folder name
    def previous_year(additional: '')
      DateBaseName.new.to_yyyy(Date.today << 12, additional: additional)
    end

    # Get years folder name list
    #
    # @param [String] year yyyymmdd format string
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def years(year, count: 3, additional: '')
      year = Date.new(year[0..3].to_i)
      DateBaseName.new.to_yyyy_list(year, count: count, additional: additional)
    end
  end
end
# rubocop enable LineLength
