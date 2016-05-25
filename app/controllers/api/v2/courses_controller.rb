class Api::V2::CoursesController < API::V2::ApiController
  #before_action :authenticate_user!
  #before_action :set_course, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user! #Descomentar si necesitan autenticacion

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    #Para acceder a los usuarios, basta con hacer @course.users
    rescue ActiveRecord::RecordNotFound
      head :not_found
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: {
				success: :created
			}
      head :created
    else
      if @course.errors.any?
	        errors = @course.errors.full_messages.first
	        @course.errors.full_messages.each do |msg|
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

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    if @course
      if @course.update(course_params)
        render :show, status: :ok, location: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end

    else
      head :no_content
    end


  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    if @course
      @course.destroy
      head :ok
    else
      head :no_content
    end
  end

  # GET /courses/1/users
  def users
    @course = Course.find(params[:id])
    @users = @course.users

    if @course
      render json: @users
    else
      head :not_found
    end
    rescue ActiveRecord::RecordNotFound
      head :not_found
  end

  # POST /courses/1/users/1
  def addUser
    @course = Course.where(id: params[:id])

    @user = User.find(params[:userId])

    if @course && @user
      if !(@user.courses.include? @course)
        @user.user_courses.create(course: @course.first)
      end
    else
      head :not_found

    end

    rescue ActiveRecord::RecordNotFound
      head :not_found
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :semester, :year)
    end
end
