class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:index, :show, :new, :edit, :create, :update, :destroy]


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @project.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    #@task = Task.new(task_params)
     @task = @project.tasks.create(task_params)
     redirect_to project_tasks_path, notice: 'Task was successfully created.' 
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
    redirect_to project_tasks_path, notice: 'Task was successfully updated.'
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    redirect_to project_path(@project), notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name)
    end
end
