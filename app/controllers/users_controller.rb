class UsersController < ApplicationController
  	
  	before_action :authenticate_user!
	before_filter :authorize_admin, except: [:edit]

	# GET /users
	def index
		@users = User.all
	end

	# GET /users/:id
	def show
		@user = User.find(params[:id])
		#@tests = Array.new
		#@evaluations = Evaluation.all
		@evaluation = Evaluation.find(1)
		@lastTest = Test.where( :user_id => @user.id, :grade =>  0.9..7.1 ).last 

		#ME RETORNA TODOS LOS DATOS DEL USUARIO RESPECTIVO
		#LOS LLENE MANUALMENTE EN LA BASE DE DATOS MIENTRAS
		#INTENTE CREAR UN ARREGLO ALTIRO EN EL CODIGO PERO ME TIRABA UN ERROR
		#SOLO ME PODIA CREAR UN TEST CON VALORES DETERMINADOS POR MI, NO UN ARRAY =/
		@tests = Test.all

		##DEFINO MEJOR NOTA, PEOR NOTA y PROMEDIO
		@mejorNota = 0
		@peorNota = 7.0
		@promedioNota
		sumadorNotas = 0
		cantidadNotas = 0 

		##RECORRO EL ARRAY PARA OBTENER LA MEJOR PEOR Y PROMEDIO DE NOTA

		@tests.each do |test|
			if test.grade
				if test.grade > @mejorNota
					@mejorNota = test.grade
				end
	
				if test.grade < @peorNota
					@peorNota = test.grade
				end
	
				sumadorNotas = sumadorNotas + test.grade
				cantidadNotas = cantidadNotas + 1
			end
		end

		@promedioNota = sumadorNotas / cantidadNotas






		



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
			render :new
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
