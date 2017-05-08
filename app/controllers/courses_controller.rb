class CoursesController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :new, :destroy, :create]

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    render locals: { contents: Content.all }
  end

  # GET /courses/1/edit
  def edit
    begin
      @course = Course.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
    render locals: { contents: Content.all }
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
      if @course.save
        redirect_to controller: 'users', action: "show", id:current_user
      else
        render 'new'
      end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    begin
      @course = Course.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
      if @course.update(course_params)
         redirect_to controller: 'users', action: "show", id:current_user
      else
        render 'new'
      end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    begin
      @course = Course.find(params[:id]).destroy
    rescue StandardError => e
      puts "Error: #{e}"
    end
      redirect_to controller: 'users', action: "show", id:current_user
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, content_ids: [])
    end

    def admin_user
      redirect_to(root_url) unless current_user.is_admin?
    end
end
