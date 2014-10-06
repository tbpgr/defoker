# encoding: utf-8
require 'spec_helper'
require 'defoker_core'
require 'timecop'

describe Defoker::Core do
  context :init do
    DEFOKERFILE_TMP_DIR = 'tmp_init'
    cases = [
      {
        case_no: 1,
        case_title: 'valid new year mail',
        expected: Defoker::DEFOKERFILE_TEMPLATE
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          Defoker::Core.init

          # -- then --
          actual = File.read("./#{Defoker::DEFOKERFILE_PATH}")
          expect(actual).to eq(c[:expected])
        ensure
          case_after c

        end
      end

      def case_before(c) # rubocop:disable UnusedMethodArgument
        Dir.mkdir(DEFOKERFILE_TMP_DIR) unless Dir.exist? DEFOKERFILE_TMP_DIR
        Dir.chdir(DEFOKERFILE_TMP_DIR)
      end

      def case_after(c) # rubocop:disable UnusedMethodArgument
        Dir.chdir('../')
        FileUtils.rm_rf(DEFOKERFILE_TMP_DIR) if Dir.exist? DEFOKERFILE_TMP_DIR
      end
    end
  end

  context :today do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '20140901'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '20140901_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.today(additional: c[:additional])

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

  context :tomorrow do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '20140902'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '20140902_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.travel(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.tomorrow(additional: c[:additional])

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

  context :yesterday do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '20140831'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '20140831_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.travel(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.yesterday(additional: c[:additional])

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

  context :days do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        date: '20140909',
        count: 4,
        additional: '',
        expected: %w(20140909 20140910 20140911 20140912)
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        date: '20140909',
        count: 4,
        additional: 'hoge',
        expected: %w(20140909_hoge 20140910_hoge 20140911_hoge 20140912_hoge)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --

          # -- when --
          actual = Defoker::Core.days(c[:date], count: c[:count], additional: c[:additional])

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

  context :this_month do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '201409'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '201409_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.this_month(additional: c[:additional])

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

  context :next_month do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '201410'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '201410_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.next_month(additional: c[:additional])

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

  context :previous_month do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '201408'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '201408_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.previous_month(additional: c[:additional])

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

  context :months do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        month: '201410',
        count: 4,
        additional: '',
        expected: %w(201410 201411 201412 201501)
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        month: '201410',
        count: 4,
        additional: 'hoge',
        expected: %w(201410_hoge 201411_hoge 201412_hoge 201501_hoge)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --

          # -- when --
          actual = Defoker::Core.months(c[:month], count: c[:count], additional: c[:additional])

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

  context :this_year do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '2014'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '2014_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.this_year(additional: c[:additional])

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

  context :next_year do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '2015'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '2015_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.next_year(additional: c[:additional])

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

  context :previous_year do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: '',
        expected: '2013'
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: 'hoge',
        expected: '2013_hoge'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = Defoker::Core.previous_year(additional: c[:additional])

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

  context :years do
    cases = [
      {
        case_no: 1,
        case_title: 'no additional case',
        year: '2014',
        count: 4,
        additional: '',
        expected: %w(2014 2015 2016 2017)
      },
      {
        case_no: 2,
        case_title: 'with additional case',
        year: '2014',
        count: 4,
        additional: 'hoge',
        expected: %w(2014_hoge 2015_hoge 2016_hoge 2017_hoge)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --

          # -- when --
          actual = Defoker::Core.years(c[:year], count: c[:count], additional: c[:additional])

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

  context :rule do
    DEFOKER_RULE_TMP_DIR = 'tmp_rule'
    DEFOKER_CASE1_INPUT = <<-EOS
type :today
base ""
    EOS
    DEFOKER_CASE2_INPUT = <<-EOS
type :this_month
base "hoge"
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'default case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        input: DEFOKER_CASE1_INPUT,
        additional: '',
        expected: '20140901'
      },
      {
        case_no: 2,
        case_title: 'default case with additional',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        input: DEFOKER_CASE1_INPUT,
        additional: 'hoge',
        expected: '20140901_hoge'
      },
      {
        case_no: 3,
        case_title: 'this_motth, hoge base case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        input: DEFOKER_CASE2_INPUT,
        additional: '',
        expected: '201409_hoge'
      },
      {
        case_no: 4,
        case_title: 'this_motth, hoge base case with additional',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        input: DEFOKER_CASE2_INPUT,
        additional: 'hige',
        expected: '201409_hoge_hige'
      },
      {
        case_no: 5,
        case_title: 'no DEfokerfile case',
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        input: '',
        additional: '',
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          if c[:expect_error]
            expect  { Defoker::Core.rule(additional: c[:additional]) }.to raise_error(Defoker::DslNotExistError)
            next
          end
          actual = Defoker::Core.rule(additional: c[:additional])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        Dir.mkdir(DEFOKER_RULE_TMP_DIR) unless Dir.exist? DEFOKER_RULE_TMP_DIR
        Dir.chdir(DEFOKER_RULE_TMP_DIR)
        return if c[:input].empty?
        File.open(Defoker::DEFOKERFILE_PATH, 'w:utf-8') { |f|f.print c[:input] }
      end

      def case_after(c) # rubocop:disable UnusedMethodArgument
        Dir.chdir('../')
        FileUtils.rm_rf(DEFOKER_RULE_TMP_DIR) if Dir.exist? DEFOKER_RULE_TMP_DIR
      end
    end
  end
end
