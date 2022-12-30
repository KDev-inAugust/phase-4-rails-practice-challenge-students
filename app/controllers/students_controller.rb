class StudentsController < ApplicationController

    def index 
        students=Student.all
        render json: students
    end

    def show
        student=Student.find_by(id: params[:id])
        render json: student 
    end

    def create 
        student=Student.create(student_params)
        if student.valid?
            render json: student
        else
            render json: { errors: "make sure you have all required info, "  }, status: :unprocessable_entity
        end
    end

    def update
        student=Student.find_by(id: params[:id])
        if student
            student.update(student_params)
            render json: student
        else
            render json: { error: "Student Not Found"}, status: :not_found
        end
    end

    def destroy
        student=Student.find_by(id: params[:id])
        if student
            student.destroy
            head :no_content
        else 
            render json: {error: "Student Not Found"}, status: :not_found
        end
    end

        private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end
