class Employee < ActiveRecord::Base
  belongs_to :division
  has_and_belongs_to_many :projects

  def current_project
    Project.find_by current: true
  end

  def completed_projects
    Project.where("current = false")
  end
end
