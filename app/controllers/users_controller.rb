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
    per_page = 10
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
		#@tests = Array.new
		#@evaluations = Evaluation.all
		@evaluation = Evaluation.find(1)
		@lastTest = Test.where( :user_id => @user.id, :grade =>  0.9..7.1 ).last

    		#Solicitado: Objeto test con todos los tests realizados:
    		@userTests = Test.where( :user_id => @user.id )

		#ME RETORNA TODOS LOS DATOS DEL USUARIO RESPECTIVO
		#LOS LLENE MANUALMENTE EN LA BASE DE DATOS MIENTRAS
		#INTENTE CREAR UN ARREGLO ALTIRO EN EL CODIGO PERO ME TIRABA UN ERROR
		#SOLO ME PODIA CREAR UN TEST CON VALORES DETERMINADOS POR MI, NO UN ARRAY =/


		##DEFINO MEJOR NOTA, PEOR NOTA y PROMEDIO
		@mejorNota = 0
		@peorNota = 7.0
		@promedioNota = 0
		sumadorNotas = 0
		cantidadNotas = 0

		##RECORRO EL ARRAY PARA OBTENER LA MEJOR PEOR Y PROMEDIO DE NOTA

		@userTests.each do |test|
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

		if cantidadNotas != 0
			@promedioNota = sumadorNotas / cantidadNotas
		end


		# Esto sirve para enviar la HTML sin layout. Dado que esta vista
		# se carga como ventana emergente dentro de otra, no necesita tener
		# el header, footer, cargar los scripts, etc. Solo carga el contenido del body.
		respond_to do |format|
			format.html { render :layout => false }
		end

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
			redirect_to(users_path)
		else
			redirect_to(users_path)
				if @user.errors.any?
					@user.errors.full_messages.each do |msg|
					flash[:error] = msg
				end

			end
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
      params.require(:user).permit(:name, :email, :rut, :user_type, :password, :suspended,:password_confirmation)
    end
