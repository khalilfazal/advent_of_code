require 'active_record'

class Input < ActiveRecord::Base
  validates_uniqueness_of :year, scope: :day
end