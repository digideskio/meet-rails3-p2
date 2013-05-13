class PeopleController < ApplicationController


  def index
    @people = Person.order("first_name ASC").all

  end

  def show
    @person = params[:id]
  end

end
