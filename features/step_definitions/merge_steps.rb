Given /^the blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
end

Given /^the following users exist:$/ do |users_table|
	users_table.hashes.each do |user|
		User.create(user)
	end
end

Given /^the following articles exist:$/ do |articles_table|
	articles_table.hashes.each do |art|
		user = User.where(:login => art['user']).first
		article = Article.new({:title => art['title'], :body => art['body'], :user_id => user.id})
		article.publish!
	end
end

Given /^I am logged into the admin panel as (.*)\((.*)\)$/ do |username, password|
  visit '/accounts/login'
  fill_in 'user_login', :with => username
  fill_in 'user_password', :with => password
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I am logged into the admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
