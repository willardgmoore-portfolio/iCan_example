class ClassroomsController < ApplicationController
  def index 
    @classrooms = Classroom.all
    authorize! :index, @classroom
  end

  def new
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      flash[:success] = "Porject was saved!"
      redirect_to root_path
    else
      render "new"
    end
    authorize! :create, @classroom
  end

  private

  def classroom_params
    params.require(:classroom).permit(:title)
  end
end
