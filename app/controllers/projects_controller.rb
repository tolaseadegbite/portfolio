class ProjectsController < ApplicationController
    before_action :authenticate_user!, only: %i[ new create edit update destroy ]
    before_action :find_project, only: %i[ edit show update destroy ]
    before_action :correct_user, only: %i[ edit update destroy ]

    def index
        @projects = Project.order(created_at: :desc) 
    end

    def new
        @project = Project.new
    end

    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            
            redirect_to projects_url, notice: 'Project was successfully created'
        else
            render 'new', status: :unprocessable_entity, notice: current_user.errors.full_messages.join(", ")
        end
    end

    def show
        
    end

    def edit
    end

    def update
        if @project.update(project_params)
            flash[:notice] = "Project successfully updated"
            redirect_to projects_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        
    end

    private

        def project_params
            params.require(:project).permit(:title, :description, :github_link, :preview_link, :image)
        end

        def find_project
            @project ||= Project.find(params[:id])
        end

        # confirms the correct user
        def correct_user
            @project ||= Project.find(params[:id])
            redirect_to(projects_url, status: :see_other, notice: "Access denied") unless current_user == @project.user
        end
end