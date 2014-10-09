# Defoker

[![Gem Version](https://badge.fury.io/rb/defoker.svg)](http://badge.fury.io/rb/defoker)
[![Build Status](https://travis-ci.org/tbpgr/defoker.png?branch=master)](https://travis-ci.org/tbpgr/defoker)
[![Coverage Status](https://coveralls.io/repos/tbpgr/defoker/badge.png)](https://coveralls.io/r/tbpgr/defoker)

Defoker is date/month/year base format named folder generator.
Defoker = DatE format FOlder maKER.

## Demo
![defoker demo](./images/defoker.gif)

## Target Versions
* Ruby 2.0
* Ruby 2.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'defoker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defoker

## Usage
### help
~~~bash
$ defoker help
~~~

### today
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker today
$ ls -F | grep /
20141001/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker today -a hoge
$ ls -F | grep /
20141001_hoge/
~~~

### tomorrow
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker tomorrow
$ ls -F | grep /
20141002/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker tomorrow -a hoge
$ ls -F | grep /
20141002_hoge/
~~~

### yesterday
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker yesterday
$ ls -F | grep /
2014930/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker yesterday -a hoge
$ ls -F | grep /
2014930_hoge/
~~~

### days
* no count, additional text

~~~bash
# default = 3 directories
$ defoker days 20140920
$ ls -F | grep /
20140920/
20140921/
20140922/
~~~

* with repeat count, additional text

~~~bash
$ defoker days 20140920 -c 4 -a hoge
$ ls -F | grep /
20140920_hoge/
20140921_hoge/
20140922_hoge/
20140923_hoge/
~~~

### this_month
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker this_month
$ ls -F | grep /
201410/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker this_month -a hoge
$ ls -F | grep /
201410_hoge/
~~~

### next_month
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker next_month
$ ls -F | grep /
201411/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker next_month -a hoge
$ ls -F | grep /
201411_hoge/
~~~

### previous_month
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker previous_month
$ ls -F | grep /
201409/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker previous_month -a hoge
$ ls -F | grep /
201409_hoge/
~~~

### months
* no count, additional text

~~~bash
$ defoker months 201410
$ ls -F | grep /
201410/
201411/
201412/
~~~

* with count, additional text

~~~bash
$ defoker months 201410 -c 4 -a hoge
$ ls -F | grep /
201410_hoge/
201411_hoge/
201412_hoge/
201501_hoge/
~~~

### this_year
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker this_year
$ ls -F | grep /
2014/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker this_year -a hoge
$ ls -F | grep /
2014_hoge/
~~~

### next_year
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker next_year
$ ls -F | grep /
2015/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker next_year -a hoge
$ ls -F | grep /
2015_hoge/
~~~

### previous_year
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker previous_year
$ ls -F | grep /
2013/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker previous_year -a hoge
$ ls -F | grep /
2013_hoge/
~~~

### years
* no count, additional text

~~~bash
$ ls -F | grep /
2014/
2015/
2016/
~~~

* with count, additional text

~~~bash
$ defoker years 2014 -c 4 -a hoge
$ ls -F | grep /
2014_hoge/
2015_hoge/
2016_hoge/
2017_hoge/
~~~

### rule-output
* generate Defokerfile template

~~~bash
$ defoker init
$ cat Defokerfile
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
~~~

* execute by default Defokerfile

~~~bash
# execute at 2014/10/01
$ defoker rule
$ ls -F | grep /
20141001/
$ defoker rule -a hoge
$ ls -F | grep /
20141001_hoge/

# execute at 2014/10/02
$ defoker rule
$ ls -F | grep /
20141002/
$ defoker rule -a hoge
$ ls -F | grep /
20141002_hoge/
~~~

* edit Defokerfile.(type = previous_month, base = monthly_report)

~~~bash
$ cat Defokerfile
type :previous_month
base 'monthly_report'
~~~

* execute by edited Defokerfile.

~~~bash
# execute at 2014/10
$ defoker rule
$ ls -F | grep /
201409_monthly_report/
$ defoker rule -a hoge
$ ls -F | grep /
201409_monthly_report_hoge/

# execute at 2014/11
$ defoker rule
$ ls -F | grep /
201410_monthly_report/
$ defoker rule -a hoge
$ ls -F | grep /
201410_monthly_report_hoge/
~~~

* edit Defokerfile with callback.(type = previous_month, base = monthly_report)

~~~bash
$ cat Defokerfile
type :previous_month
base 'monthly_report'
callback ->(dir) {
  p dir
  File.open("#{dir}/template.txt", 'w:utf-8') { |e|e.puts "template for #{dir}" }
  File.open("#{dir}/template.rb'" 'w:utf-8') { |e|e.puts "puts '#{dir}'" }
}

$ tree
# execute at 20141006
$ defoker rule -a hige
"20141006_hige"
# execute at 20141007
$ defoker rule -a hoge
"20141007_hoge"
# execute at 20141008
$ defoker rule -a hage
"20141008_hage"
$ tree
┣ 20141006_hige
┃ ┣ template.rb
┃ ┗ template.txt
┣ 20141007_hoge
┃ ┣ template.rb
┃ ┗ template.txt
┗ 20141008_hage
  ┣ template.rb
  ┗ template.txt
~~~

### mv_month
move daily folders to monthly folder.

* Before move

~~~bash
$ tree
┣ 20141006_hige
┣ 20141007_hoge
┣ 20141106_hige
┣ 20141107_hoge
┣ 20141206_hige
┣ 20141207_hoge
┣ 20150106_hige
┣ 20150107_hoge
┗ invalid_folder
~~~

* Excute mv_month

~~~bash
$ defoker mv_month
$ tree
┣ 201410
┃   ┣ 06_hige
┃   ┗ 07_hoge
┣ 201411
┃   ┣ 06_hige
┃   ┗ 07_hoge
┣ 201412
┃   ┣ 06_hige
┃   ┗ 07_hoge
┣ 201501
┃   ┣ 06_hige
┃   ┗ 07_hoge
┗ invalid_folder
~~~

### mv_year
move monthly folders to yearly folder.

* Before move

~~~bash
$ tree
┣ 201410
┃   ┣ 06_hige
┃   ┗ 07_hoge
┣ 201411
┃   ┣ 06_hige
┃   ┗ 07_hoge
┣ 201412
┃   ┣ 06_hige
┃   ┗ 07_hoge
┣ 201501
┃   ┣ 06_hige
┃   ┗ 07_hoge
┗ invalid_folder
~~~

* Excute mv_month

~~~bash
$ defoker mv_year
┣ 2014
┃  ┣ 10
┃  ┃   ┣ 06_hige
┃  ┃   ┗ 07_hoge
┃  ┣ 11
┃  ┃   ┣ 06_hige
┃  ┃   ┗ 07_hoge
┃  ┗ 12
┃  　   ┣ 06_hige
┃  　   ┗ 07_hoge
┣ 2015
┃  ┗ 01
┃       ┣ 06_hige
┃       ┗ 07_hoge
┗ invalid_folder
~~~

### gem_info
show gem information.

~~~bash
$ defoker gem_info
 ____        __       _
|  _ \  ___ / _| ___ | | _____ _ __
| | | |/ _ \ |_ / _ \| |/ / _ \ '__|
| |_| |  __/  _| (_) |   <  __/ |
|____/ \___|_|  \___/|_|\_\___|_|

[gem name]
defoker
[version]
0.0.8
[document url]
https://github.com/tbpgr/defoker
[RubyGems url]
http://rubygems.org/gems/defoker
~~~

## History
* version 0.0.8 : Add gem_info command. Add debug option.
* version 0.0.7 : Add mv_month, mv_year commands.
* version 0.0.6 : Add callback in Defokerfile.
* version 0.0.5 : Fix typo in Defokerfile Template.
* version 0.0.4 : Add init/rule command for rule-output.
* version 0.0.3 : Fix typo in gemspec.
* version 0.0.2 : Fix typo and change public interface tommorow to tomorrow.
* version 0.0.1 : First release.

## Contributing

1. Fork it ( https://github.com/tbpgr/defoker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
