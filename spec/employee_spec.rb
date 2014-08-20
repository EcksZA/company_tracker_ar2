require 'spec_helper'

describe Employee do
  it 'is a member of a division' do
    division1 = Division.create({:name => "Engineering"})
    employee1 = Employee.create({:name => "John Snow", :division_id => division1.id})
    expect(employee1.division).to eq division1
  end

  it "returns the current project the employee is working" do
    employee1 = Employee.create({:name => "Jon Snow"})
    project1 = Project.create({:name => "Find Igrit", :current => false})
    project2 = Project.create({:name => "Protect the North", :current => true})
    expect(employee1.current_project).to eq project2
  end

  it 'returns the list of all projects(regardless of status) for a single employee' do
    employee1 = Employee.create({:name => "Jon Snow"})
    project1 = Project.create({:name => "Find Igrit", :current => false})
    project2 = Project.create({:name => "Protect the North", :current => false})
    contribution1 = Contribution.create({:project_id => project1.id, :employee_id => employee1.id})
    contribution2 = Contribution.create({:project_id => project2.id,})
    expect(employee1.projects).to eq [project1]
  end

  it "lists an employees contribution to a project" do
    employee1 = Employee.create({:name => "Jon Snow"})
    project1 = Project.create({:name => "Find Igrit"})
    project2 = Project.create({:name => "Protect the North"})
    contribution1 = Contribution.create({:employee_id => employee1.id, :description => "Looked for her beyond the wall"})
    contribution2 = Contribution.create({:description => "Kept Sam alive"})
    contribution3 = Contribution.create({:employee_id => employee1.id, :description => "Warned the men of the watch"})
    project1.contributions << contribution1
    project2.contributions << contribution3
    expect(employee1.contributions).to eq [contribution1, contribution3]
  end

  it "lists the project an employee has worked on between two dates" do
    employee1 = Employee.create({:name => "Jon Snow"})
    contribution1 = Contribution.create({:employee_id => employee1.id, :description => "Looked for Igrit beyond the wall"})
    contribution2 = Contribution.create({:employee_id => employee1.id, :description => "Kept Sam alive"})
    contribution3 = Contribution.create({:employee_id => employee1.id, :description => "Warned the men of the watch"})
    project1 = Project.create({:name => "Find Igrit", :start_date => '2014-04-28', :end_date => '2014-08-08'})
    project2 = Project.create({:name => "Protect the North", :start_date => '2013-12-28', :end_date => '2014-03-25'})
    project3 = Project.create({:name => "Revenge families murder", :start_date => '2014-06-07', :end_date => '2014-12-17'})
    employee1.projects << project1
    employee1.projects << project2
    employee1.projects << project3
    beginning = '2014-07-07'
    ending = '2014-11-07'
    expect(employee1.projects_during(beginning, ending)).to eq [project1, project3]
  end
end
