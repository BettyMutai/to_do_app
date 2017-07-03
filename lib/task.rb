class Task
    define_method(:initialize) do |description|
        @description=description
    end

    define_method(:description) do
        @description
    end

    define_singleton_method(:all) do
      []
    end
end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new("wash the lion")
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end