class Api::V1::CoursesController < API::V1::ApiController

	# GET /api/v1/courses
	def index
    	@courses = Course.all
  	end

end
