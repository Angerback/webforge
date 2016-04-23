class UsersController < ApplicationController

  	before_action :authenticate_user!
	before_filter :authorize_admin, except: [:edit]

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
		@users = User.all
		if params[:search]
      @searching = true
			@users = User.search(params[:search])
		#else
			#@users = User.all.order("created_at DESC")
		end
	end

	# GET /users/:id
	def show
		@user = User.find(params[:id])
		#@tests = Array.new
		#@evaluations = Evaluation.all
		@evaluation = Evaluation.find(1)
		@lastTest = Test.where( :user_id => @user.id, :grade =>  0.9..7.1 ).last

		#if Test.where( :user_id => current_user.id, :grade =>  0.9..7.1 ).last
		#	@evaluations.each do |evaluation|
		#		@tests[evaluation.id] = Test.where( :user_id => current_user.id,
  		#	                     		  			:evaluation_id => evaluation.id,
  		#	                      		  			:grade =>  0.9..7.1 ).last
		#	end
		#end
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
			redirect_to users_path
			flash[:success] = "Usuario creado exitosamente"
		else
			redirect_to users_path
      if @user.errors.any?
        errors = @user.errors.full_messages.first
        @user.errors.full_messages.each do |msg|
          if errors != msg
            errors = errors + ", " + msg
          end
        end
        flash[:error] = errors
      end
		end

	end

	 # PATCH/PUT /users/:id
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Usuario actualizado exitosamente"
			redirect_to @user
		else
			render :edit
		end
	end

	# DELETE /users/:id
	def destroy
		@user = User.find(params[:id])
		if @user.admin
			flash[:danger] = "El usuario es administrador del sistema y no puede ser eliminado"
		else
			@user.destroy
			flash[:success] = "Usuario eliminado exitosamente"
		end
		redirect_to(users_path)
	end
end

private
      # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :rut, :user_type, :password)
    end
