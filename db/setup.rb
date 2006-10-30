#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../config/environment'

RegionDimension.create(:name => 'North America', :country => 'United States')
RegionDimension.create(:name => 'North America', :country => 'Canada')
RegionDimension.create(:name => 'Central America', :country => 'Mexico')
RegionDimension.create(:name => 'South America', :country => 'Peru')