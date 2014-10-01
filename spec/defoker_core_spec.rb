# encoding: utf-8
require "spec_helper"
require "defoker_core"
require "timecop"

describe Defoker::Core do
  context :today do
    cases = [
      {
        case_no: 1,
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "20140901"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "20140901_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.today(additional: c[:additional])

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

  context :tommorow do
    cases = [
      {
        case_no: 1,
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "20140902"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "20140902_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.travel(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.tommorow(additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "20140831"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "20140831_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.travel(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.yesterday(additional: c[:additional])

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
        case_title: "no additional case",
        date: "20140909",
        count: 4,
        additional: "",
        expected: ["20140909","20140910","20140911","20140912"]
      },
      {
        case_no: 2,
        case_title: "with additional case",
        date: "20140909",
        count: 4,
        additional: "hoge",
        expected: ["20140909_hoge", "20140910_hoge", "20140911_hoge", "20140912_hoge"]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new

          # -- when --
          actual = defoker_core.days(c[:date], count: c[:count], additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "201409"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "201409_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.this_month(additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "201410"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "201410_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.next_month(additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "201408"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "201408_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.previous_month(additional: c[:additional])

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
        case_title: "no additional case",
        month: "201410",
        count: 4,
        additional: "",
        expected: ["201410","201411","201412","201501"]
      },
      {
        case_no: 2,
        case_title: "with additional case",
        month: "201410",
        count: 4,
        additional: "hoge",
        expected: ["201410_hoge","201411_hoge","201412_hoge","201501_hoge"]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new

          # -- when --
          actual = defoker_core.months(c[:month], count: c[:count], additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "2014"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "2014_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.this_year(additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "2015"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "2015_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.next_year(additional: c[:additional])

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
        case_title: "no additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "",
        expected: "2013"
      },
      {
        case_no: 2,
        case_title: "with additional case",
        dummy_year: 2014,
        dummy_month: 9,
        dummy_day: 1,
        additional: "hoge",
        expected: "2013_hoge"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new
          Timecop.freeze(Time.local(c[:dummy_year], c[:dummy_month], c[:dummy_day]))

          # -- when --
          actual = defoker_core.previous_year(additional: c[:additional])

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
        case_title: "no additional case",
        year: "2014",
        count: 4,
        additional: "",
        expected: ["2014","2015","2016","2017"]
      },
      {
        case_no: 2,
        case_title: "with additional case",
        year: "2014",
        count: 4,
        additional: "hoge",
        expected: ["2014_hoge","2015_hoge","2016_hoge","2017_hoge"]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          defoker_core = Defoker::Core.new

          # -- when --
          actual = defoker_core.years(c[:year], count: c[:count], additional: c[:additional])

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
