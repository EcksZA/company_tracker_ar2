class Employee < ActiveRecord::Base
  belongs_to :division
  has_many :contributions
  has_many :projects, through: :contributions

  def current_project
    Project.find_by current: true
  end

  def completed_projects
    Project.where("current = false")
  end
end
