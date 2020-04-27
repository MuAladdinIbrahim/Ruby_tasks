class AuthorizeApiRequest
    prepend SimpleCommand
  
    def initialize(headers = {})
      @headers = headers
    end
  
    def call
      user
    end
  
    private
  
    attr_reader :headers 
    #c reader because we read headers not set them
  
    def user
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
      @user || errors.add(:token, 'Invalid token') && nil
    end

    #c ||= is called a conditional assignment operator.
    #c It basically works as = but with the exception that if a variable has already been assigned it will do nothing.
  
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end
  
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
        #c split(' ') to remove Bearar from Authorization filed
        #c .last to get the token
      else
        errors.add(:token, 'Missing token')
      end
      nil
    end
  end

  #c steps of script:
  #c 1 gets token from headers in def http_auth_header
  #c 2 decoded_auth_token decodes the token received
  #c 3 find user in def user using id retrieved from decoded_auth_token
