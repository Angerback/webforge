class BankAccount < ActiveRecord::Base

	belongs_to :user, dependent: :destroy

  	validates :user_id, presence: true
  	validates :balance, presence: true,
  			          	numericality: {greater_than_or_equal_to: 0}
    validates :status, presence: true

end
