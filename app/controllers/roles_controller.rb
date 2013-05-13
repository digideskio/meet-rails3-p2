class RolesController < ApplicationController

  respond_to :html

  def new
    # it's a nested resouce, projects manipulate their own roles. Roles belong to a project.
    # For security and convenience, retrieve associated objects through the parent.
    @role = project.roles.new

    # logger.info @project.title
    respond_with [project, @role]
  end

  def create
    # Getting my head around the strong_parameters
    # @role = project.roles.new(params[:role]) # ForbiddenAttributesError

    # permit replaces attr_accessible and attr_protected that used to be in models
    # @role = project.roles.new(params[:role].permit(:project_id, :status_id, :title, :person_id))

    # or you can use require(:role) makes sure the params exist to avoid a nil exception
    # @role = project.roles.new(params.require(:role).permit(:project_id, :status_id, :title, :person_id))

    # take the previous and put it in its own method
    @role = project.roles.new(role_params)

    new_was_successful = @role.save

    # respond_with is easy to override and
    # we need to because by default it goes to the role's show action
    # but here we want to redirect back to projects after a role has been saved.
    respond_with [project, @role] do |format|
      format.html {
        if new_was_successful
          redirect_to project_path(project), :notice => "The role was created"
        else
          render 'new'
        end
      }
    end
  end

  private

  def project
    # Only use memoization with expensive operations that aren't alredy cached.
    # using the mallet operator, we can either return the current project if it exists or go search the database to find by id.
    @project ||= Project.find(params[:project_id])
  end

  def role_params
    # params[:role].permit(:project_id, :status_id, :title, :person_id)
    params.require(:role).permit(:project_id, :status_id, :title, :person_id)
  end

end
