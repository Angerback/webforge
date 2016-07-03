class Api::V2::UsersController < API::V2::ApiController

  @@tokens = Hash.new
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
		@evaluation = Evaluation.find(1)
		@lastTest = Test.where( :user_id => @user.id, :grade =>  0.9..7.1 ).last

    rescue ActiveRecord::RecordNotFound
      head :not_found
	end

	# GET /users/:id/grades
	def  show_grades
		@user = User.find(params[:id])
		@test = Test.where( :user_id => @user.id, :grade =>  0.9..7.1 )
	end

	# GET /users/grades
	def  show_grades_last
		@test = Test.where( :grade =>  0.9..7.1 ).last
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
  rescue ActiveRecord::RecordNotFound
    head :not_found
end

# POST /users/start_session
def start_session
  if @@tokens[params[:token]] or @@tokens.has_value?(params[:email])
    #Si existe el email en el Hash de tokens, es porque el usuario ya se logueo
    user = User.where(email: params[:email]).first
    render json: {
        outcome: "Ya está logueado.",
        idUser: user.id,
        rol: user.user_type

     }
  else
    #Busca al usuario por su correo para ver si se puede loguear
    user = User.where(email: params[:email]).first
    if user
      user.sign_in_count = user.sign_in_count + 1
      user.save
      @@tokens[params[:token]] = params[:email]
      render json: {
          outcome: "Login exitoso.",
          idUser: user.id,
          rol: user.user_type
       }
    else
      render json: {
          outcome: "Usuario no existe."
       }
    end

  end
end

# POST /users/end_session
def end_session
  if @@tokens[params[:token]]
    #Si existe el email en el Hash de tokens, es porque el usuario ya se logueo
    @@tokens.delete(params[:token])
    render json: {
        outcome: "Sesión cerrada."
     }
  else
    render json: {
        outcome: "Sesión no existe."
     }
  end
end

# GET /users/:user_id/evaluations/:evaluation_id/compare
def compare
  @user = User.where(id: params[:user_id]).last
  if @user
   @companions = []
   @tests = Hash.new
   @sum = 0
   @userLastEval = Test.where(user_id: params[:user_id], evaluation_id: params[:evaluation_id], :grade =>  0.9..7.1).last
   @cantidadCompanerosNotaMenor = 0
    @user.courses.each do |course|
      course.users.each do |companion|
        if companion.id != @user.id
          if ! (@companions.include? companion)
            lastEval= Test.where(user_id: companion.id, evaluation_id: params[:evaluation_id], :grade =>  0.9..7.1).last
            if lastEval
              @companions.push(companion)
              @tests[companion.id] = lastEval
              @sum = @sum + lastEval.grade
              if @userLastEval.grade > lastEval.grade
                @cantidadCompanerosNotaMenor = @cantidadCompanerosNotaMenor + 1
              end
            end
          end
        end
      end
    end
    @avg = @sum / @companions.length
    render json: {
        promedioCurso: @avg,
        cantidadCompaneros: @companions.length,
        cantidadCompanerosNotaMenor: @cantidadCompanerosNotaMenor
     }
  else
    render json: {
        outcome: "Usuario no existe."
     }
  end

end



private
      # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :rut, :user_type, :password, :suspended, :notificaciones, :password_confirmation)
    end
end
