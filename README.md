# Defoker

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

### tommorow
* no additional text

~~~bash
# execute at 2014/10/01
$ defoker tommorow
$ ls -F | grep /
20141002/
~~~

* with additional text

~~~bash
# execute at 2014/10/01
$ defoker tommorow -a hoge
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

## History
* version 0.0.1 : First release.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/defoker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request