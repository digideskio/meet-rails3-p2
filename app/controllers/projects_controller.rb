class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # set the formats for the respond_with method, more useful for a data only application/controller
  respond_to :html, :xml, :json

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new

    respond_with @project
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    # respond_with replaces the respond_to boilerplate and does the samething in a single line
    # it looks at the url extension or the except header and serves the right file format, you need to declare the data formats you want it to respond_to at the top of the class
    repsond_with @project
    # respond_to do |format|
    #   if @project.save
    #     format.html { redirect_to @project, notice: 'Project was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @project }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @project.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update

    respond_with @project
    # respond_to do |format|
    #   if @project.update(project_params)
    #     format.html { redirect_to @project, notice: 'Project was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @project.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    repsond_with @project
    # respond_to do |format|
    #   format.html { redirect_to projects_url }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title)
    end
end
