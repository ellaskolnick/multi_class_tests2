require 'todo_list'

RSpec.describe TodoList do
  describe "incomplete tasks" do
    context "when nothing is incomplete" do
      it "returns an empty array" do
        todo_list = TodoList.new
        expect(todo_list.incomplete).to eq []
      end
    end
  end

  describe "complete tasks" do
    context "when nothing is complete" do
      it "returns an empty array" do
        todo_list = TodoList.new
        expect(todo_list.complete).to eq []
      end
    end
  end

  describe "give up" do
    context "when there are no tasks" do
      it "fails" do
        todo_list = TodoList.new
        expect{ todo_list.give_up! }.to raise_error "There are no tasks to give up on!"
      end
    end
  end
end
