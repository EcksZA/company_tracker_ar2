require 'spec_helper'

describe Project do
  it 'shows which employee is working on the project' do
    employee1 = Employee.create({:name => "John Snow"})
    project1 = Project.create({:name => "Protect the North"})
    project1.employees << employee1
    expect(project1.employees).to eq [employee1]
  end

  it 'allows for multiple employees per project' do
    employee1 = Employee.create({:name => "John Snow"})
    employee2 = Employee.create({:name => "Sam Tarly"})
    project1 = Project.create({:name => "Protect the North"})
    project1.employees << employee1
    project1.employees << employee2
    expect(project1.employees).to eq [employee1, employee2]
  end
end


