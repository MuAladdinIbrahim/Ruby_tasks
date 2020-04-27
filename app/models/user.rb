class User < ApplicationRecord
    has_secure_password ##ensure that passwrd is encrypted into the db
end
