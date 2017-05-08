class ContentsController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  # GET /contents/1
  # GET /contents/1.json
  def show
    begin
      @content = Content.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
    @course_content = Content.joins(:courses).where('course_id = ?', @content)
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
    begin
      @content = Content.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
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
    begin
      @content = Content.find(params[:id])
    rescue StandardError => e
      puts "Error: #{e}"
    end
      if @content.update(content_params)
        redirect_to controller: 'users', action: "show", id:current_user
      else
        render 'new'
      end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    begin
      @content = Content.find(params[:id]).destroy
    rescue StandardError => e
      puts "Error: #{e}"
    end
    redirect_to controller: 'users', action: "show", id:current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:content_one)
    end

     def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
