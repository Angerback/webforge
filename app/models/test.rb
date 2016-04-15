class Test < ActiveRecord::Base

	has_many :answers, dependent: :destroy 

end
