class Product < ActiveRecord::Base
  belongs_to :company
  has_many :reviews, dependant :destroy

end
