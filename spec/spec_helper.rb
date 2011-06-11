$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "rubygems"
require "rspec"
require "sham"

module Spec
  module Mongoid
    def self.configure!
      ::Mongoid.configure do |config|
        config.master = Mongo::Connection.new.db("machinist_mongoid")
        config.allow_dynamic_fields = true
      end

      ::Rspec.configure do |config|
        config.before(:each) { Sham.reset }
        config.after(:all)   { ::Mongoid.master.collections.each { |c| c.remove } }
      end
    end
  end
end
