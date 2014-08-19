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
    employee1.projects << project1
    employee1.projects << project2
    expect(employee1.projects).to eq [project1, project2]
  end
end
