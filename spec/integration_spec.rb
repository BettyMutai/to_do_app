require('capybara/rspec')
  require('./app')
  require('spec_helper')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a new list', {:type => :feature}) do
    it('allows a user to click a list to see the tasks and details for it') do
      visit('/')
      # click_link('Add New List')
      fill_in('name', :with => 'Moringaschool Work')
      click_button('Add list')
      expect(page).to have_content('Welcome to the To Do App')
    end
  end

  describe('viewing all of the lists', {:type => :feature}) do
    it('allows a user to see all of the lists that have been created') do
      list = List.new({:name => 'Moringaschool Homework',:id => nil})
      list.save()
      visit('/')
      # click_link('View All Lists')
      expect(page).to have_content(list.name)
    end
  end

  describe('seeing details for a single list', {:type => :feature}) do
    it('allows a user to click a list to see the tasks and details for it') do
      test_list = List.new({:name => 'School stuff', :id => nil})
      test_list.save()
      test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
      test_task.save()
      visit('/')
      click_link(test_list.name())
      expect(page).to have_content(test_task.description())
    end
  end

  describe('adding tasks to a list', {:type => :feature}) do
    it('allows a user to add a task to a list') do
      test_list = List.new({:name => 'School stuff', :id => nil})
      test_list.save()
      visit("/")
      fill_in("Description", {:with => "Learn SQL"})
      click_button("Add Task")
      expect(page).to have_content("Tasks")
    end
  end
