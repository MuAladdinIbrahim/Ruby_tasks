class User < ApplicationRecord
    attr_accessor :password ##getter-setter for password
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true
    validates :password, :confirmation => true #password_confirmation attr
    validates_length_of :password, :in => 6..20, :on => :create
    salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
    encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to {password}")
end