#!/usr/bin/env ruby

$:.unshift(File.dirname(__FILE__))

require File.dirname(__FILE__) + '/../config/environment'

# Copied from rake task
ddb = ActiveWarehouse::Builder::DateDimensionBuilder.new(Date.new(2001, 1, 1), Date.new(2007, 1, 1))
ddb.build.each do |record|
  dd = DateDimension.new
  record.each do |key,value|
    dd.send("#{key}=".to_sym, value) if dd.respond_to?(key)
  end
  dd.save!
end

require 'setup/store'
require 'setup/product'
require 'setup/pos_retail_sales_transaction'