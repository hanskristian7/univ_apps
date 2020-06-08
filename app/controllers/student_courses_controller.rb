class StudentCoursesController < ApplicationController
    def create
        course = Course.find(params[:course_id])
        # render json: course.id
        unless current_user.courses.include?(course)
            StudentCourse.create(student_id: current_user.id, course_id: course.id)
            flash[:notice] = "#You successfully enrolled to #{course.name}"
            redirect_to root_path
        else
            flash[:notice] = "Your enrollment failed"
            redirect_to root_path
        end
    end
end