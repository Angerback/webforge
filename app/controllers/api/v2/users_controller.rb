class Api::V2::UsersController < API::V2::ApiController

  #	before_action :authenticate_user!
	#before_filter :authorize_admin, except: [:edit]

  def get_user(id)
    @user = User.find(params[:id])
    @evaluation = Evaluation.find(1)
		@lastTest = Test.where( :user_id => @user.id, :grade =>  0.9..7.1 ).last
  end
  helper_method :get_user

	# GET /users
	def index
    @evaluation = Evaluation.find(1)
    @user = User.new
    @searching = false
    per_page = 100
    if params[:per_page]
      per_page = params[:per_page].to_i
    end

		if params[:search]
      @searching = true
			@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => per_page)
		else
			@users =  User.paginate(:page => params[:page], :per_page => per_page)
		end

	end

	# GET /users/:id
	def show
		@user = User.find(params[:id])


	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/edit
	def edit
		@user = User.find(params[:id])
	end

	# POST /users
	def create
		@user = User.new(user_params,
			             password_confirmation: params[:password])
		if @user.save
			render json: {
				success: :created
			}
      head :created
			#redirect_to '/api/v2/users/'
			#flash[:success] = "Usuario creado exitosamente"
		else
			#redirect_to '/api/v2/users/'
      if @user.errors.any?
	        errors = @user.errors.full_messages.first
	        @user.errors.full_messages.each do |msg|
	        if errors != msg
	            errors = errors + ", " + msg
    		  end
    		end
    		render json: {
    			success: errors
    		}
    		#flash[:error] = errors
      end
      head :unprocessable_entity
		end

	end

	 # PATCH/PUT /users/:id
	def update
		@user = User.find(params[:id])
  		if @user.update(user_params)
  			#flash[:success] = "Usuario actualizado exitosamente"
  			#redirect_to(users_path)
        render :show, status: :ok, location: @user
  		else
  			#redirect_to(users_path)
        render json: @user.errors, status: :unprocessable_entity
			end
	end


	# DELETE /users/:id
def destroy
	@user = User.find(params[:id])
  if @user
    @user.destroy
    head :ok
  else
    head :no_content
  end
end


private
      # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :rut, :user_type, :password, :suspended,:password_confirmation)
    end
end
