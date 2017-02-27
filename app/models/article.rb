class Article < ActiveRecord::Base
    belongs_to :user
    validates :title,   presence: true, 
                        length: {minimum: 5, maximum: 50} #, 
    #                     format: { 
    #                         with: /\A[a-zA-Z0-9]*\z/, 
    #                         :message => 'no special characters, only letters and numbers'  
    #                     }
    validates :description, presence: true, 
                            length: {minimum:10, maximum: 300}#, 
                            # format: { 
                            #     with: /\A[a-zA-Z0-9]*\z/, 
                            #     :message => 'no special characters, only letters and numbers'
                            # }
    validates :user_id, presence: true
end