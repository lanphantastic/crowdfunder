class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  
  def index
    @projects = Project.order(:end_date)

    if params[:category_id]
      @projects = @projects.where(category_id: params[:category_id])
    end

    @projects = @projects.active if params[:status] == 'active'
    @projects = @projects.inactive if params[:status] == 'inactive'
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
    @update = Update.new
    @updates = Update.all
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]
    @project.start_date = params[:project][:start_date]
    @project.end_date = params[:project][:end_date]
    @project.image = params[:project][:image]
    @project.category_id = params[:project][:category_id]
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

   private

    def claimed_summary
      Claim.where(project_id: @project.id).count
    end

    helper_method :claimed_summary
end
