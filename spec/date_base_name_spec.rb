# encoding: utf-8
require 'spec_helper'
require 'date_base_name'
require 'date'

describe Defoker::DateBaseName do
  context :to_yyyymmdd do
    cases = [
      {
        case_no: 1,
        case_title: 'no addition, 1digit month, 1digit day case',
        date: Date.new(2014, 9, 9),
        additional: '',
        expected: '20140909'
      },
      {
        case_no: 2,
        case_title: 'no addition, 2digit month, 1digit day case',
        date: Date.new(2014, 12, 9),
        additional: '',
        expected: '20141209'
      },
      {
        case_no: 3,
        case_title: 'no addition, 1digit month, 2digit day case',
        date: Date.new(2014, 9, 12),
        additional: '',
        expected: '20140912'
      },
      {
        case_no: 4,
        case_title: 'with addition case',
        date: Date.new(2014, 9, 12),
        additional: 'hoge',
        expected: '20140912_hoge'
      },
      {
        case_no: 5,
        case_title: 'omit addition case',
        date: Date.new(2014, 9, 12),
        additional: nil,
        expected: '20140912'
      },
      {
        case_no: 6,
        case_title: 'invalid date case',
        date: '20140912',
        expect_error: true
      },
      {
        case_no: 7,
        case_title: 'datetime case',
        date: DateTime.new(2014, 9, 12),
        additional: nil,
        expected: '20140912'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker = Defoker::DateBaseName.new

          # -- when --
          actual =
            if c[:additional]
              defoker.to_yyyymmdd(c[:date], additional: c[:additional])
            else
              if c[:expect_error]
                expect  { defoker.to_yyyymmdd(c[:date]) }.to raise_error(ArgumentError)
                next
              end
              defoker.to_yyyymmdd(c[:date])
            end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :to_yyyymmdd_list do
    cases = [
      {
        case_no: 1,
        case_title: 'no addition 4days case',
        day: Date.new(2014, 9, 9),
        count: 4,
        expected: %w(20140909 20140910 20140911 20140912)
      },
      {
        case_no: 2,
        case_title: 'no addition 1day case',
        day: Date.new(2014, 9, 12),
        count: 1,
        expected: ['20140912']
      },
      {
        case_no: 3,
        case_title: 'with addition 4days case',
        day: Date.new(2014, 9, 9),
        count: 4,
        additional: 'hoge',
        expected: %w(20140909_hoge 20140910_hoge 20140911_hoge 20140912_hoge)
      },
      {
        case_no: 4,
        case_title: 'invalid date case',
        day: '20140912',
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker = Defoker::DateBaseName.new

          # -- when --
          actual =
            if c[:count] && c[:additional]
              defoker.to_yyyymmdd_list(c[:day], count: c[:count], additional: c[:additional])
            elsif c[:count]
              defoker.to_yyyymmdd_list(c[:day], count: c[:count])
            elsif c[:additional]
              defoker.to_yyyymmdd_list(c[:day], additional: c[:additional])
            else
              if c[:expect_error]
                expect  { defoker.to_yyyymmdd_list(c[:day]) }.to raise_error(ArgumentError)
                next
              end
              defoker.to_yyyymmdd_list(c[:day])
            end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :to_yyyymm do
    cases = [
      {
        case_no: 1,
        case_title: 'no addition, 1digit month',
        month: Date.new(2014, 9),
        additional: '',
        expected: '201409'
      },
      {
        case_no: 2,
        case_title: 'no addition, 2digit month',
        month: Date.new(2014, 12),
        additional: '',
        expected: '201412'
      },
      {
        case_no: 4,
        case_title: 'with addition case',
        month: Date.new(2014, 9),
        additional: 'hoge',
        expected: '201409_hoge'
      },
      {
        case_no: 5,
        case_title: 'omit addition case',
        month: Date.new(2014, 9),
        additional: nil,
        expected: '201409'
      },
      {
        case_no: 6,
        case_title: 'invalid month case',
        month: '201409',
        expect_error: true
      },
      {
        case_no: 7,
        case_title: 'datetime case',
        month: DateTime.new(2014, 9),
        additional: nil,
        expected: '201409'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker = Defoker::DateBaseName.new

          # -- when --
          actual =
            if c[:additional]
              defoker.to_yyyymm(c[:month], additional: c[:additional])
            else
              if c[:expect_error]
                expect  { defoker.to_yyyymm(c[:month]) }.to raise_error(ArgumentError)
                next
              end
              defoker.to_yyyymm(c[:month])
            end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :to_yyyymm_list do
    cases = [
      {
        case_no: 1,
        case_title: 'no addition 4months case',
        month: Date.new(2014, 10),
        count: 4,
        expected: %w(201410 201411 201412 201501)
      },
      {
        case_no: 2,
        case_title: 'no addition 1month case',
        month: Date.new(2014, 9),
        count: 1,
        expected: ['201409']
      },
      {
        case_no: 3,
        case_title: 'with addition 4months case',
        month: Date.new(2014, 10),
        count: 4,
        additional: 'hoge',
        expected: %w(201410_hoge 201411_hoge 201412_hoge 201501_hoge)
      },
      {
        case_no: 4,
        case_title: 'no addition, no count, 3months case',
        month: Date.new(2014, 10),
        expected: %w(201410 201411 201412)
      },
      {
        case_no: 5,
        case_title: 'invalid month case',
        month: '201409',
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker = Defoker::DateBaseName.new

          # -- when --
          actual =
            if c[:count] && c[:additional]
              defoker.to_yyyymm_list(c[:month], count: c[:count], additional: c[:additional])
            elsif c[:count]
              defoker.to_yyyymm_list(c[:month], count: c[:count])
            elsif c[:additional]
              defoker.to_yyyymm_list(c[:month], additional: c[:additional])
            else
              if c[:expect_error]
                expect  { defoker.to_yyyymm_list(c[:month]) }.to raise_error(ArgumentError)
                next
              end
              defoker.to_yyyymm_list(c[:month])
            end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :to_yyyy do
    cases = [
      {
        case_no: 1,
        case_title: 'no addition case',
        year: Date.new(2014),
        additional: '',
        expected: '2014'
      },
      {
        case_no: 2,
        case_title: 'with addition case',
        year: Date.new(2014),
        additional: 'hoge',
        expected: '2014_hoge'
      },
      {
        case_no: 3,
        case_title: 'omit addition case',
        year: Date.new(2014),
        expected: '2014'
      },
      {
        case_no: 4,
        case_title: 'invalid year case',
        year: '2014',
        expect_error: true
      },
      {
        case_no: 5,
        case_title: 'datetime case',
        year: DateTime.new(2014),
        additional: nil,
        expected: '2014'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker = Defoker::DateBaseName.new

          # -- when --
          actual =
            if c[:additional]
              defoker.to_yyyy(c[:year], additional: c[:additional])
            else
              if c[:expect_error]
                expect  { defoker.to_yyyy(c[:year]) }.to raise_error(ArgumentError)
                next
              end
              defoker.to_yyyy(c[:year])
            end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :to_yyyy_list do
    cases = [
      {
        case_no: 1,
        case_title: 'no addition 4years case',
        year: Date.new(2014),
        count: 4,
        expected: %w(2014 2015 2016 2017)
      },
      {
        case_no: 2,
        case_title: 'no addition 1year case',
        year: Date.new(2014),
        count: 1,
        expected: ['2014']
      },
      {
        case_no: 3,
        case_title: 'with addition 4years case',
        year: Date.new(2014, 10),
        count: 4,
        additional: 'hoge',
        expected: %w(2014_hoge 2015_hoge 2016_hoge 2017_hoge)
      },
      {
        case_no: 4,
        case_title: 'no addition, no count, 3years case',
        year: Date.new(2014),
        expected: %w(2014 2015 2016)
      },
      {
        case_no: 5,
        case_title: 'invalid year case',
        from_or_range: '2014',
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker = Defoker::DateBaseName.new

          # -- when --
          actual =
            if c[:count] && c[:additional]
              defoker.to_yyyy_list(c[:year], count: c[:count], additional: c[:additional])
            elsif c[:count]
              defoker.to_yyyy_list(c[:year], count: c[:count])
            elsif c[:additional]
              defoker.to_yyyy_list(c[:year], additional: c[:additional])
            else
              if c[:expect_error]
                expect  { defoker.to_yyyy_list(c[:year]) }.to raise_error(ArgumentError)
                next
              end
              defoker.to_yyyy_list(c[:year])
            end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
