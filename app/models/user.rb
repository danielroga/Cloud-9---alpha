class User < ActiveRecord::Base
    validates :username,    presence: true,
                            uniqueness: {case_sensitive: false}, #ensures uniques upper/lower case
                            length: {minimum: 6, maximum: 15},
                            format: { 
                                with: /\A[a-zA-Z0-9]*\z/, 
                                :message => 'Only Alphanumeric Characters'  
                            }

    validates :email,       presence: true,
                            uniqueness: {  case_sensitive: false    }, #ensures uniques upper/lower case_sensitive
                            length: {   maximum: 50 },
                            format: {
                                with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, #REGEX email validation
                                :message => 'Not a Valid Email Address'
                            }
end