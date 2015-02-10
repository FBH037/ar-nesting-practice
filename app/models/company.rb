class Company < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :products, dependent: :destroy
end
