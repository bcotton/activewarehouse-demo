#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../config/environment'

# Copied from rake task
ddb = ActiveWarehouse::Builder::DateDimensionBuilder.new(Time.now.years_ago(5), Time.now) # TODO: start and end dates should be configurable?
ddb.build.each do |record|
  dd = DateDimension.new
  record.each do |key,value|
    dd.send("#{key}=".to_sym, value) if dd.respond_to?(key)
  end
  dd.save!
end