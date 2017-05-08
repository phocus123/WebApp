class UsersController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :new, :destroy, :create]
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  def show
     @users = User.all
     @courses = Course.all 
     @contents = Content.all

    begin
  	  @user = User.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end

    begin
      @user_courses = Course.joins(:users).where('user_id = ?', @user.id)
    rescue StandardError => e
      puts "Error: #{e}"
    end
  end

  def new
  	@user = User.new

    render locals: { courses: Course.all }
  end

  def create
  	@user = User.new(user_params)
  		if @user.save
        redirect_to action: "show", id:current_user
  		else
  			render 'new'
  		end
  end

  def edit
    begin
      @user = User.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
    render locals: { courses: Course.all }
  end

  def update
    begin
      @user = User.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
      if@user.update_attributes(user_params)
        redirect_to action: "show", id:current_user
      else
        render 'edit'
      end
  end

  def destroy
   begin
      @user = User.find(params[:id]).destroy
    rescue StandardError => e
      puts "Error: #{e}"
    end
        redirect_to action: "show", id:current_user
  end  

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :is_admin, course_ids: [])
  	end

    def logged_in_user 
      unless logged_in?
        redirect_to login_url
      end
    end

    def correct_user
      begin
      @user = User.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
      redirect_to(login_url) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.is_admin?
    end
end
