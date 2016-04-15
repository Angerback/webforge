class Record < ActiveRecord::Base

	belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id', dependent: :destroy
  	belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_id'

  	validates :owner_id, presence: true
  	validates :receiver_id, presence: true
  	validates :operation, presence: true
  	validates :amount, presence: true,
  			          numericality: {greater_than_or_equal_to: 0}

end
