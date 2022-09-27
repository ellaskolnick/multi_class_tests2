require 'todo'

RSpec.describe Todo do
  describe "task" do
    context "task method is called" do
      it "returns the task" do
        todo = Todo.new("eat")
        expect(todo.task).to eq "eat"
      end
    end
  end

  describe "done" do
    context "the test has not been marked as done" do
      it "returns false" do
        todo = Todo.new("eat")
        expect(todo.done?).to eq false
      end
    end

    context "the test has been marked as done" do
      it "returns false" do
        todo = Todo.new("eat")
        todo.mark_done!
        expect(todo.done?).to eq true
      end
    end
  end
end
