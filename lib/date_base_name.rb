# encoding: utf-8
require 'date'

module Defoker
  # DateBaseName provides methods that various kind of date-base formated name.
  # date base, month base, year base, and etc...
  class DateBaseName
    # Get date-base formated name.
    # if additional is empty, return date YYYYMMDD.
    # if additional is not empty, return date YYYYMMDD_additional.
    #
    # @example only date
    #   DateBaseName.new.to_yyyymmdd(Date.new(2014,9,9)) #=> "20140909"
    # @example date with additional text
    #   DateBaseName.new.to_yyyymmdd(Date.new(2014,9,9), additional: 'hoge') #=> "20140909_hoge"
    #
    # @param [Date,DateTime] date target date
    # @param [String] additional additional text.
    #     If you want to get only date, you can omit this option.
    # @return [String] date-based formated name
    #
    def self.to_yyyymmdd(date, additional: '')
      DateBaseNameValidators.validate_date(date)
      v = date.strftime('%Y%m%d')
      return v if additional.empty?
      "#{v}_#{additional}"
    end

    # Get date-base formated name list.
    # if additional is empty, return date YYYYMMDD.
    # if additional is not empty, return date YYYYMMDD_additional.
    #
    # @example only date
    #   DateBaseName.new.to_yyyymmdd_list(Date.new(2014,9,9), Date.new(2014,9,12))
    #   => ["20140909","20140910","20140911","20140912"]
    # @example date with additional text
    #   DateBaseName.new.to_yyyymmdd_list(Date.new(2014,9,9), count: Date.new(2014,9,12), additional: 'hoge')
    #   => ["20140909_hoge", "20140910_hoge", "20140911_hoge", "20140912_hoge"]
    # @example range
    #   DateBaseName.new.to_yyyymmdd_list(Date.new(2014,9,9)..Date.new(2014,9,12), additional: 'hoge')
    #   => ["20140909_hoge", "20140910_hoge", "20140911_hoge", "20140912_hoge"]
    #
    # @param [Date,DateTime,Range] day date or from-count range
    # @param [Date] count count date.
    # @param [String] additional additional text.
    #     If you want count get only date, you can omit this option.
    # @return [Array(String)] date-based formated names
    def self.to_yyyymmdd_list(day, count: nil, additional: '')
      DateBaseNameValidators.validate_date(day)
      count.times.with_object([]) do |i, memo|
        memo << to_yyyymmdd(day + i, additional: additional)
      end
    end

    # Get month-base formated name.
    # if additional is empty, return month YYYYMM.
    # if additional is not empty, return month YYYYMM_additional.
    #
    # @example only month
    #   DateBaseName.new.to_yyyymm(Date.new(2014,9)) #=> "201409"
    # @example month with additional text
    #   DateBaseName.new.to_yyyymm(Date.new(2014,9), additional: 'hoge') #=> "201409_hoge"
    #
    # @param [Date,DateTime] month target month
    # @param [String] additional additional text.
    #     If you want to get only month, you can omit this option.
    # @return [String] month-based formated name
    #
    def self.to_yyyymm(month, additional: '')
      DateBaseNameValidators.validate_date(month)
      v = month.strftime('%Y%m')
      return v if additional.empty?
      "#{v}_#{additional}"
    end

    # Get month-base formated name list.
    # if additional is empty, return month YYYYMM.
    # if additional is not empty, return month YYYYMM_additional.
    #
    # @example only month
    #   DateBaseName.new.to_yyyymm_list(Date.new(2014,10), count: 4))
    #   => ["201410","201411","20141","201501"]
    # @example only month (omit count. default = 3)
    #   DateBaseName.new.to_yyyymm_list(Date.new(2014,10)))
    #   => ["201410","201411","20141"]
    # @example month with additional text
    #   DateBaseName.new.to_yyyymm_list(Date.new(2014,9,9), count: 4, additional: 'hoge')
    #   => ["201410_hoge","201411_hoge","20141_hoge","201501_hoge"]
    #
    # @param [Date,DateTime] month month
    # @param [Fixnum] count month count. default = 3.
    # @param [String] additional additional text.
    #     If you want to get only month, you can omit this option.
    # @return [Array(String)] month-based formated names
    def self.to_yyyymm_list(month, count: 3, additional: '')
      DateBaseNameValidators.validate_date(month)
      count.times.with_object([]) do |i, memo|
        memo << to_yyyymm(month >> i, additional: additional)
      end
    end

    # Get year-base formated name.
    # if additional is empty, return year YYYY.
    # if additional is not empty, return year YYYY_additional.
    #
    # @example only year
    #   DateBaseName.new.to_yyyy(Date.new(2014)) #=> "2014"
    # @example year with additional text
    #   DateBaseName.new.to_yyyy(Date.new(2014), additional: 'hoge') #=> "2014_hoge"
    #
    # @param [Date,DateTime] year target year
    # @param [String] additional additional text.
    #     If you want to get only year, you can omit this option.
    # @return [String] year-based formated name
    #
    def self.to_yyyy(year, additional: '')
      DateBaseNameValidators.validate_date(year)
      v = year.strftime('%Y')
      return v if additional.empty?
      "#{v}_#{additional}"
    end

    # Get year-base formated name list.
    # if additional is empty, return year YYYY.
    # if additional is not empty, return year YYYY_additional.
    #
    # @example only year
    #   DateBaseName.new.to_yyyymm_list(Date.new(2014), count: 4))
    #   => ["2014","2015","2016","2017"]
    # @example only year (omit count. default = 3)
    #   DateBaseName.new.to_yyyymm_list(Date.new(2014)))
    #   => ["2014","2015","2016"]
    # @example year with additional text
    #   DateBaseName.new.to_yyyymm_list(Date.new(2014), count: 4, additional: 'hoge')
    #   => ["2014_hoge","2015_hoge","2016_hoge","2017_hoge"]
    #
    # @param [Date,DateTime] year year
    # @param [Fixnum] count year count. default = 3.
    # @param [String] additional additional text.
    #     If you want to get only year, you can omit this option.
    # @return [Array(String)] year-based formated names
    def self.to_yyyy_list(year, count: 3, additional: '')
      DateBaseNameValidators.validate_date(year)
      count.times.with_object([]) do |i, memo|
        memo << to_yyyy(year >> (i * 12), additional: additional)
      end
    end
  end

  # InvalidRange
  class InvalidRange < StandardError; end

  # Validators
  class DateBaseNameValidators
    def self.validate_date(date)
      return if [Date, DateTime].include?(date.class)
      fail ArgumentError, "invalid argument type #{date.class}"
    end
  end
end
