class InstructorsController < ApplicationController
    def index
        instructor=Instructor.all
        render json: instructor
    end

    def show
        instructor=Instructor.find_by(id: params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create(instructor_params)
        if instructor.valid?
        render json: instructor, status: :created
        else
            render json: {errors: "make sure you have entered everythng correctly"}, status: :unprocessable_entity
        end
    end

    def update
        instructor=Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(instructor_params)
            render json: instructor
        else
            render json: { error: "Instrctor Not Found"}, status: :not_found
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else 
            render json: {error: "Instructor Not Found"}, status: :not_found
        end
    end

    private
    def instructor_params
        params.permit(:name)
    end

end


 