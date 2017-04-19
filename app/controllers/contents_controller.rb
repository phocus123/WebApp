class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all
  end
  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])
    @course_content = Content.joins(:courses).where('course_id = ?', @content)
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

      if @content.save
        redirect_to controller: 'users', action: "show", id:current_user
      else
        render 'new'
      end
    
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
      if @content.update(content_params)
        redirect_to controller: 'users', action: "show", id:current_user
      else
        render 'new'
      end
    
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    redirect_to controller: 'users', action: "show", id:current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:content_one)
    end

     def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
