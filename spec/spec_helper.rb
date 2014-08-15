require 'puppetlabs_spec_helper/module_spec_helper'
require 'puppet_facts'
include PuppetFacts
RSpec.configure do |c|
c.formatter = :documentation
end
