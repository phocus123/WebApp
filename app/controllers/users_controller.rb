class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :edit, :update, :new, :destroy, :create, :new]
  
  def show
  	@user = User.find(params[:id])
    @users = User.all
    @user_courses = Course.joins(:users).where('user_id = ?', @user.id )
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  		if @user.save
        flash[:notice] = "User created"
        redirect_to action: "show", id:current_user
  		else
  			render 'new'
  		end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if@user.update_attributes(user_params)
        flash[:notice] = "User information updated"
        redirect_to action: "show", id:current_user
      else
        render 'edit'
      end
  end

  def destroy
   User.find(params[:id]).destroy
   flash[:notice] = "User deleted"
        redirect_to action: "show", id:current_user
  end  

  private

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :is_admin)
  	end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.is_admin?
    end
end
