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


  end

  private

  def project
    # Only use memoization with expensive operations that aren't alredy cached.
    # using the mallet operator, we can either return the current project if it exists or go search the database to find by id.
    @project ||= Project.find(params[:project_id])
  end

end
