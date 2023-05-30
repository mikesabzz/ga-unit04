class StudentsController < ApplicationController
    def index
        # @students = ["Ben", "Charles", "Phil", "David"]
        # render plain: @students.join(', ')
        # render json: { name: "ben" }
    end

    def show
        render plain: "Student: " + params[:id] 
    end
end