class Api::V1::BankAccountsController < API::V1::ApiController

	# GET /api/v1/bank_accounts/:user_id
	def show
		@bank_account = BankAccount.find_by(user_id: params[:user_id])
	end

	# POST /api/v1/bank_accounts/:user_id
	def create
    	@bank_account = BankAccount.new(bank_account_params)
    	if @bank_account.save
			head :created
		else
			head :unprocessable_entity
		end
  	end

	# PUT /api/v1/bank_accounts/:id
  	def update  		
	    @bank_account = BankAccount.find(params[:id])

	    @record = Record.new( 
	    					owner_id: params[:owner_id],
	    					receiver_id: params[:receiver_id],
	    					operation: params[:operation],
	    					amount: params[:amount])
		
		if @bank_account.update(bank_account_params) && @record.save
			if params[:operation] == "efectua transferencia a"
				Notifier.notify(User.find(params[:receiver_id]),
								User.find(params[:owner_id]),
								params[:amount]).deliver_now
			end
			head :found
		else
			head :unprocessable_entity
		end
  	end

  	private
	    # Never trust parameters from the scary internet, only allow the white list through.
	    def bank_account_params
	      params.require(:bank_account).permit(:balance, :status, :user_id)
	    end
end