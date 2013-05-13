class Project < ActiveRecord::Base

  # remove a project, remove the roles associated to it.
  # destroy will run all the cleanup like callbacks or filters
  has_many :roles, :dependent => :destroy

  validates :title, :presence => true

end
