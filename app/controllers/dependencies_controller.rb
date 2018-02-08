class DependenciesController < ApplicationController
  before_action :set_dependency, only: [:show, :edit, :update, :destroy]
  before_action :set_project_and_task, only: [:index, :show, :new, :edit, :create, :update, :destroy]


 
  # GET /dependencies
  # GET /dependencies.json
  def index
    @dependencies = @task.dependencies
  end

  # GET /dependencies/1
  # GET /dependencies/1.json
  def show
  end

  # GET /dependencies/new
  def new
    @dependency = Dependency.new
  end

  # GET /dependencies/1/edit
  def edit
  end

  # POST /dependencies
  # POST /dependencies.json
  def create
    #@dependency = Dependency.new(dependency_params)
    @dependency = @task.dependencies.create(dependency_params)
    redirect_to project_task_dependencies_path(@project, @task), notice: 'Dependency was successfully created.'
       
  end

  # PATCH/PUT /dependencies/1
  # PATCH/PUT /dependencies/1.json
  def update
      @dependency.update(dependency_params)
      redirect_to project_task_dependencies_path(@project, @task), notice: 'Dependency was successfully updated.' 
     
  end

  # DELETE /dependencies/1
  # DELETE /dependencies/1.json
  def destroy
    @dependency.destroy
    redirect_to project_task_dependencies_path(@project, @task), notice: 'Dependency was successfully destroyed.' 
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dependency
      @dependency = Dependency.find(params[:id])
    end

  def set_project_and_task
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def dependency_params
      params.require(:dependency).permit(:name)
    end
end
