class Company < ActiveRecord::Base
  has_many :locations, dependant :destroy
  has_many :products, dependant :destroy
end
