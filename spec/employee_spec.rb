require 'spec_helper'

describe Employee do
  it 'is a member of a division' do
    division1 = Division.create({:name => "Engineering"})
    employee1 = Employee.create({:name => "John Snow", :division_id => division1.id})
    expect(employee1.division).to eq division1
  end

  it "returns the employee's project" do
    employee1 = Employee.create({:name => "John Snow"})
    project1 = Project.create({:name => "Protect the North", :employee_id => employee1.id})
    project2 = Project.create({:name => "Watch the Wall", :employee_id => employee1.id})
    expect(employee1.projects).to eq [project1, project2]
  end

  it "returns the current project the employee is working" do
    employee1 = Employee.create({:name => "Jon Snow"})
    project1 = Project.create({:name => "Find Igrit", :employee_id => employee1.id, :current => false})
    project2 = Project.create({:name => "Protect the North", :employee_id => employee1.id, :current => true})
    expect(employee1.current).to eq project2
  end
end
