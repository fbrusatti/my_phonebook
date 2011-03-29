Given /^I have no contacts$/ do
  Contact.delete_all
end

Then /^I should have (\d+) contact$/ do |count|
  Contact.count.should == count.to_i
end

Given /^I have contacts named (.+)$/ do |names|
  names.split(', ').each do |name|
    Contact.create!(:first_name => name)
  end
end


Given /^I have (\d+) contact$/ do |count|
  count.to_i.times {|x| Contact.create(:first_name => x)}
end

