require 'active_record'

# noinspection RailsParamDefResolve
class Input < ActiveRecord::Base
  validates_uniqueness_of :year, scope: :day
end