class ProjectsController < ApplicationController
    before_filter :authenticate_user!
    load_and_authorize_resource

    def index
        if params[:status]
            @projects = current_user.projects.where('status = ?', params[:status])
            @projects = current_user.is_admin? ? Project.all : current_user.projects
        else
            @projects = current_user.projects
      end
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.user_id = current_user.id
        if @project.save
            redirect_to projects_path
        else
            render action: 'new'
        end
    end

    def show
        @project = Project.find(params[:id])
        @task = Task.new
    end

    def edit
        @project = Project.find(params[:id])
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path, notice: "Successfully deleted #{@project.name}"
    end

    private

    def project_params
        params[:project].permit(:name, :client_id, :description, :start_date, :end_date, :status, :budget, category_ids: [])
    end
end
