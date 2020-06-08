class StudentsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    before_action :require_same_student, only: [:edit, :update, :destroy]
    
    def index
        @students = Student.all
    end

    def show
        # @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def edit
        # @student = Student.find(params[:id])
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            # render json: @student
            flash[:success] = "You have successfully signed up!"
            redirect_to student_path(@student)
        else
            render 'new'
        end
    end

    def update
        # render json: student_params
        updated = @student.update(student_params)
        if updated
            flash[:notice] = "Successfully updated profile..."
            redirect_to student_path(@student)
        end
    end

    private
    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email, :password)
    end

    def require_same_student
        if current_user != @student
            flash[:notice] = "You can only edit your own profile"
            redirect_to student_path(current_user)
        end
    end
end
