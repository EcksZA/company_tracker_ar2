require 'active_record'
require 'rspec'

require './lib/employee'
require './lib/division'
require './lib/project'
require './lib/contribution'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do | config |
  config.after(:each) do
    Employee.all.each {|employee| employee.destroy}
    Division.all.each {|division| division.destroy}
    Project.all.each {|project| project.destroy}
    Contribution.all.each {|contribution| contribution.destroy}
  end
end
