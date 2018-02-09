class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :assign_project, :assigned_project, :assign_member, :assigned_member, :assign_member_project, :assigned_member_project, :assigned_member_project_task, :member_project_task, :users_details]
  before_action :set_permission, only: [:new, :edit, :update, :destroy]


  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_project
    @projects = Project.all
  end


  def assigned_project
    projects = params[:assign_project][:project_id]-[""]
    @team.projects.destroy_all
    projects.each do |project_id|
      ProjectTeam.create(team_id: params[:assign_project][:team_id], project_id: project_id)
    end
    redirect_to team_path()
  end

  def assign_member
      @users =  User.where(team_id: nil)
  end

  def assigned_member
    users = params[:assign_member][:user_id]-[""]
    users.each do |user_id|
       User.find(user_id).update(team_id: params[:assign_member][:team_id])
    end
    redirect_to team_path()
  end

  def assign_member_project
    @projects = @team.projects
    @users = @team.users
  end

  def assigned_member_project
    user_id = params[:assign_project_member][:user_id]
    project_id = params[:assign_project_member][:project_id]
    @user = User.find(user_id)
    @project = Project.find(project_id)
    @tasks=MemberTask.assigned_task(user_id, project_id)
    @un_assigned_task = MemberTask.un_assigned_task(@project)
    if UserProject.is_already_assingned?(user_id, project_id)
            flash[:notice] = "This Project already assingned to this member please assign task."
    else
       UserProject.create(assigned_member_project_params)
            flash[:notice] = "Project assigned."
    end
  end

  def assigned_member_project_task
    if params[:assign_project_task_team_member][:task_id].present?
       MemberTask.create(assigned_member_project_task_params)
     end
     user_id = params[:assign_project_task_team_member][:user_id] 
     project_id = params[:assign_project_task_team_member][:project_id]
     @user = User.find(user_id)
     @project = Project.find(project_id)
     @un_assigned_task = MemberTask.un_assigned_task(@project)
     @tasks = MemberTask.assigned_task(@user.id, @project.id)

  end

  def member_project_task
   @user = User.find(params[:user_id])
  end

   def users_details
     @user = User.find(params[:user_id])
   end 


  private

   def set_permission
      if !ApplicationAuthorizer.creatable_by?(current_user)
        redirect_to root_path, notice: 'You are not Authorize.' 
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end

    def assign_params
      params.require(:assign_project).permit(:project_id, :team_id)
    end

    def assigned_member_project_params
      params.require(:assign_project_member).permit(:user_id, :project_id)
    end
    def assigned_member_project_task_params
       params.require(:assign_project_task_team_member).permit(:task_id, :team_id, :user_id, :project_id)
    end
end
