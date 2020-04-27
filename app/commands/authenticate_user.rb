class AuthenticateUser
    prepend SimpleCommand #c enables.. the alias methods of the simple_command can be used
  
    #c The command takes the user's e-mail and password
    #c then returns the user, if the credentials match

    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_accessor :email, :password
  
    def user #c uses the credentials to check if the user exists in the database using find_by_email
      user = User.find_by_email(email)
      return user if user && user.authenticate(password)
      #c  authenticate() is available here because using has_secure_password in the model to check if user password is correct
      #c user is returned if credentials matches, if not the method return nil
  
      errors.add :user_authentication, 'invalid credentials'
      nil
    end
  end