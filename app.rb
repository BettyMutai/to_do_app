#App.rb is responsible for bringing our view data and our class methods together

require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/task")

  get("/") do
    @tasks = Task.all()
    erb(:index)
  end

  post("/tasks") do
    description = params.fetch("description")
    task = Task.new(description)
    task.save()
    erb(:success)
  end