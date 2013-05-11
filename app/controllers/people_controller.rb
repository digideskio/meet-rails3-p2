class PeopleController < ApplicationController


  def index
    @people = Person.order("first_name ASC").all

    @people = [
      'luke-skywalker',
      'darth-vader'
    ]

  end

  def show
    @person = params[:id]
  end

end
