class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todos << todo
  end

  def incomplete
    # Returns all non-done todos
    @todos.select{ |todo| todo.done? == false }
  end

  def complete
    # Returns all complete todos
    @todos.select{ |todo| todo.done? == true }
  end

  def give_up!
    # Marks all todos as complete
    fail "There are no tasks to give up on!" if @todos.empty?
    @todos.each { |todo| todo.mark_done! }
  end
end
