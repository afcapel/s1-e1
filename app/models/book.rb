class Book < ActiveRecord::Base
  has_many :catalogations
  has_many :libraries, :through => :catalogations
end
