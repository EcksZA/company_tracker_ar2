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

  def projects_during(beginning, ending)
    Project.where("(start_date >= ? AND start_date <= ?) OR (end_date >= ? AND end_date <= ?) OR (start_date <= ? AND end_date >= ?)" , beginning, ending, beginning, ending, beginning, ending)
  end
end
