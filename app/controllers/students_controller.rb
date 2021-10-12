class StudentsController < ApplicationController

  def index
    students = []

    if params[:name]
      Student.all.each do |student|
        if student[:first_name].include?(params[:name]) 
          students << student
        elsif student[:last_name].include?(params[:name])
          students << student
        end
      end
    else students << Student.all 
    end

    render json: students
  end

  def show 
    student = Student.find(params[:id])
    render json: student
  end

end
