require 'spec_helper'

describe Division do
  it 'will list all employees in a division' do
    division1 = Division.create({:name => "Accounting"})
    employee1 = Employee.create({:name => "John Snow", :division_id => division1.id})
    employee2 = Employee.create({:name => "Sam Tarly", :division_id => division1.id})
    expect(division1.employees).to eq [employee1, employee2]
  end

  it "will list the projects a divisions employees are working on" do
    division1 = Division.create({:name => "Accounting"})
    employee1 = Employee.create({:name => "John Snow", :division_id => division1.id})
    employee2 = Employee.create({:name => "Sam Tarly", :division_id => 2})
    employee3 = Employee.create({:name => "Robin Tully", :division_id => division1.id})
    project1 = Project.create({:name => "Protect the Wall"})
    project2 = Project.create({:name => "Find Igrit"})
    employee1.projects << project1
    employee3.projects << project2
    expect(division1.projects).to eq [project1, project2]
  end

end
