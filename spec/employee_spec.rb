require 'spec_helper'

describe Employee do
  it 'is a member of a division' do
    division1 = Division.create({:name => "Engineering"})
    employee1 = Employee.create({:name => "John Snow", :division_id => division1.id})
    expect(employee1.division).to eq division1
  end
end
