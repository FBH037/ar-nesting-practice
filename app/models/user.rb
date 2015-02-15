class User <ActiveRecord::Base
validates :email, presence: true, uniqueness: true
#or validates_uniquesness_of :email
#has_securepassword deals with uniqueness and presence of :password and :password_confirmation

has_secure_password
end
