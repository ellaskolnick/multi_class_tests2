require 'todo_list'
require 'todo'

RSpec.describe "Integration Tests" do
  describe "incomplete" do
    context "when there are incomplete tasks and no completed tasks" do
      it "retruns the incompleted task in an array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo_list.add(todo)
        expect(todo_list.incomplete).to eq [todo]
      end

      it "retruns the incomplete tasks in an array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo_list.add(todo)
        todo_list.add(todo2)
        expect(todo_list.incomplete).to eq [todo, todo2]
      end
    end

    context "when there are incompleted tasks and completed tasks" do
      it "returns the incompleted tasks in an array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo2.mark_done!
        expect(todo_list.incomplete).to eq [todo]
      end

      it "returns the incompleted tasks in an array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo3 = Todo.new("sleep")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo_list.add(todo3)
        todo2.mark_done!
        expect(todo_list.incomplete).to eq [todo, todo3]
      end
    end
  end

  describe "complete" do
    context "when there are completed tasks" do
      it "returns the completed task in an array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo_list.add(todo)
        todo.mark_done!
        expect(todo_list.complete).to eq [todo]
      end

      it "returns the completed tasks in an array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo.mark_done!
        todo2.mark_done!
        expect(todo_list.complete).to eq [todo, todo2]
      end
    end

    context "when there are completed tasks and incomplete tasks" do
      it "returns the completed tasks only in an arary" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo2.mark_done!
        expect(todo_list.complete).to eq [todo2]
      end

      it "returns the completed tasks only in an arary" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo3 = Todo.new("sleep")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo_list.add(todo3)
        todo2.mark_done!
        todo.mark_done!
        expect(todo_list.incomplete).to eq [todo3]
      end
    end
  end

  describe "give up" do
    context "incomplete method called after give up method" do
      it "will return an empty array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo3 = Todo.new("sleep")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo_list.add(todo3)
        todo_list.give_up!
        expect(todo_list.incomplete).to eq []
      end
    end

    context "complete method called after give up method" do
      it "will return a full array" do
        todo_list = TodoList.new
        todo = Todo.new("eat")
        todo2 = Todo.new("drink")
        todo3 = Todo.new("sleep")
        todo_list.add(todo)
        todo_list.add(todo2)
        todo_list.add(todo3)
        todo_list.give_up!
        expect(todo_list.complete).to eq [todo, todo2, todo3]
      end
    end
  end
end
