require 'spec_helper'

describe Project do
  it 'shows which employee is working on the project' do
    employee1 = Employee.create({:name => "John Snow"})
    project1 = Project.create({:name => "Protect the North", :employee_id => employee1.id})
    expect(project1.employee).to eq employee1
  end
end


