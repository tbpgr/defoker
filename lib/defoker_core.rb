# encoding: utf-8
require 'date_base_name'
require 'date'
require 'defoker_dsl'
require 'defoker_dsl_model'

module Defoker
  # rubocop disable LineLength
  DEFOKERFILE_PATH = 'Defokerfile'
  DEFOKERFILE_TEMPLATE = <<-EOS
# type is required.
# you can choose type from...
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
    def self.init
      File.open(DEFOKERFILE_PATH, 'w:utf-8') { |f|f.puts DEFOKERFILE_TEMPLATE }
    end

    # Get today folder name
    #
    # @param [String] additional additional name
    # @return [String] today folder name
    def self.today(additional: '')
      DateBaseName.to_yyyymmdd(Date.today, additional: additional)
    end

    # Get tomorrow folder name
    #
    # @param [String] additional additional name
    # @return [String] tomorrow folder name
    def self.tomorrow(additional: '')
      DateBaseName.to_yyyymmdd(Date.today + 1, additional: additional)
    end

    # Get yesterday folder name
    #
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def self.yesterday(additional: '')
      DateBaseName.to_yyyymmdd(Date.today - 1, additional: additional)
    end

    # Get days folder name list
    #
    # @param [String] date yyyymmdd format string
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def self.days(date, count: 3, additional: '')
      date = Date.new(date[0..3].to_i, date[4..5].to_i, date[6..7].to_i)
      DateBaseName.to_yyyymmdd_list(date, count: count, additional: additional)
    end

    # Get this month folder name
    #
    # @param [String] additional additional name
    # @return [String] this month folder name
    def self.this_month(additional: '')
      DateBaseName.to_yyyymm(Date.today, additional: additional)
    end

    # Get next month folder name
    #
    # @param [String] additional additional name
    # @return [String] next month folder name
    def self.next_month(additional: '')
      DateBaseName.to_yyyymm(Date.today >> 1, additional: additional)
    end

    # Get previous month folder name
    #
    # @param [String] additional additional name
    # @return [String] previous month folder name
    def self.previous_month(additional: '')
      DateBaseName.to_yyyymm(Date.today << 1, additional: additional)
    end

    # Get months folder name list
    #
    # @param [String] month yyyymmdd format string
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def self.months(month, count: 3, additional: '')
      month = Date.new(month[0..3].to_i, month[4..5].to_i)
      DateBaseName.to_yyyymm_list(month, count: count, additional: additional)
    end

    # Get this year folder name
    #
    # @param [String] additional additional name
    # @return [String] this year folder name
    def self.this_year(additional: '')
      DateBaseName.to_yyyy(Date.today, additional: additional)
    end

    # Get next year folder name
    #
    # @param [String] additional additional name
    # @return [String] next year folder name
    def self.next_year(additional: '')
      DateBaseName.to_yyyy(Date.today >> 12, additional: additional)
    end

    # Get previous year folder name
    #
    # @param [String] additional additional name
    # @return [String] previous year folder name
    def self.previous_year(additional: '')
      DateBaseName.to_yyyy(Date.today << 12, additional: additional)
    end

    # Get years folder name list
    #
    # @param [String] year yyyymmdd format string
    # @param [String] additional additional name
    # @return [String] yesterday folder name
    def self.years(year, count: 3, additional: '')
      year = Date.new(year[0..3].to_i)
      DateBaseName.to_yyyy_list(year, count: count, additional: additional)
    end

    # Create folder by Defokerfile's rule.
    #
    # @param [String] additional additional name
    # @return [String] folder name
    def self.rule(additional: '')
      dsl = read_dsl
      base = dsl.defoker.base
      adds = [base, additional].reject(&:empty?)
      send(dsl.defoker.type, additional: adds.join('_'))
    end

    def self.read_dsl
      dsl = Defoker::Dsl.new
      unless File.exist?(DEFOKERFILE_PATH)
        fail DslNotExistError, "#{DEFOKERFILE_PATH} not exist"
      end
      src = File.open(DEFOKERFILE_PATH, 'r:utf-8') { |f|f.read }
      dsl.instance_eval(src)
      dsl
    end
    private_class_method :read_dsl
  end

  class DslNotExistError < StandardError; end
end
# rubocop enable LineLength
