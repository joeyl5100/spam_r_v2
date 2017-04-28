require 'uri'
require 'cgi'

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

@usersession

# Single-line step scoper
# When /^(.*) within (.*[^:])$/ do |step, parent|
#   with_scope(parent) { When step }
# end

# Multi-line step scoper
# When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
#   with_scope(parent) { When "#{step}:", table_or_string }
# end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am logged in as admin$/ do
  @usersession = UserSession.create!(User.find_by_email!('admin@example.com'))
end

# Given /^I am logged in as not_admin$/ do
#   @usersession = UserSession.create!(User.find_by_email!('notadmin@example.com'))
# end

Given "I am not logged in" do
  #UserSession.find.try(:destroy)
  if @usersession != nil
    @usersession.find.try(:destroy)
  end
end

# Given /^I am not signed in$/ do
#   current_driver = Capybara.current_driver
#   begin
#     Capybara.current_driver = :rack_test
#     page.driver.submit :delete, "/users/sign_out", {}
#   ensure
#     Capybara.current_driver = current_driver
#   end
# end

Given(/^I am logged in as user$/) do
  email = 'Uuser@grinnell.edu'
  password = 'Upassword'
  
  @user = User.new(:email => email, :password => password)
  @user.save!
  @user.confirm #authenticates user
  
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

Given(/^I am logged in as admin$/) do
  @admin= User.new(:email => 'Auser@grinnell.edu',
                   :password => 'Apassword').save
  sign_in @admin
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end
When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

And "I remove admin" do  
    first(:link, 'Delete').click
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select or option
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

# When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
#   select(value, :from => field)
# end

# When /^(?:|I )check "([^"]*)"$/ do |field|
#   check(field)
# end
# When /^(?:|I )uncheck "([^"]*)"$/ do |field|
#   uncheck(field)
# end

# When /^(?:|I )choose "([^"]*)"$/ do |field|
#   choose(field)
# end
# When /^(?:|I )attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
#   attach_file(field, File.expand_path(path))
# end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then(/^I should see the text "([^"]*)"$/) do |arg1|
  #page.has_content?(arg1)
  #assert page.has_content?(arg1)
  expect(page).to have_content(arg1)
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end
Then /^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/ do |field, parent, value|
  with_scope(parent) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end
Then /^the "([^"]*)" field(?: within (.*))? should not contain "([^"]*)"$/ do |field, parent, value|
  with_scope(parent) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end
Then /^the "([^"]*)" field should have the error "([^"]*)"$/ do |field, error_message|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')
  form_for_input = element.find(:xpath, 'ancestor::form[1]')
  using_formtastic = form_for_input[:class].include?('formtastic')
  error_class = using_formtastic ? 'error' : 'field_with_errors'
  if classes.respond_to? :should
    classes.should include(error_class)
  else
    assert classes.include?(error_class)
  end
  if page.respond_to?(:should)
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      error_paragraph.should have_content(error_message)
    else
      page.should have_content("#{field.titlecase} #{error_message}")
    end
  else
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      assert error_paragraph.has_content?(error_message)
    else
      assert page.has_content?("#{field.titlecase} #{error_message}")
    end
  end
end

Then /^the "([^"]*)" field should have no error$/ do |field|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')
  if classes.respond_to? :should
    classes.should_not include('field_with_errors')
    classes.should_not include('error')
  else
    assert !classes.include?('field_with_errors')
    assert !classes.include?('error')
  end
end
Then /^the "([^"]*)" checkbox(?: within (.*))? should be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should not be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end
 
Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
Then /^(?:|I )should not be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should_not
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')} 
  
  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end
Then /^show me the page$/ do
  save_and_open_page
end
When /^(?:|I )confirm (?:|the )popup$/ do
 page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist 
end
When /^(?:|I )dismiss (?:|the )popup$/ do
 page.driver.browser.switch_to.alert.dismiss
 
end