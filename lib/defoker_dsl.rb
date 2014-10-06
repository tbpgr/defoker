# encoding: utf-8
require 'defoker_dsl_model'

module Defoker
  # Dsl
  class Dsl
    attr_accessor :defoker

    # String Define
    [:type, :base].each do |f|
      define_method f do |value|
        @defoker.send("#{f}=", value)
      end
    end

    def initialize
      @defoker = Defoker::DslModel.new
      @defoker.type = ''
      @defoker.base = ''
    end
  end
end
