require 'spec_helper'

describe Division do
  it 'will list all employees in a division' do
    division1 = Division.create({:name => "Accounting"})
    employee1 = Employee.create({:name => "John Snow", :division_id => division1.id})
    employee2 = Employee.create({:name => "Sam Tarly", :division_id => division1.id})
    expect(division1.employees).to eq [employee1, employee2]
  end
end
