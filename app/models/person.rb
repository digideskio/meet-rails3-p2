class Person < ActiveRecord::Base

  # validates is a method, :symbols are db columns
  # presence: true is like the old hash rocket :presence => true
  validates :first_name, presence: true
  validates :last_name, :presence => true # same as previous

  # callbacks
  before_save :cleanup

  def name
    "#{first_name} #{last_name}"
  end


  private

  def cleanup
    self[:first_name] = self[:first_name].capitalize
    self[:last_name] = self[:last_name].capitalize
  end


end
