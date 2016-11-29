class User < ApplicationRecord
  has_many :products
  has_secure_password
  has_many :orders
  
end
