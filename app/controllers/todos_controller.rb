class TodosController < ApplicationController
  before_action :authenticate_user!


  def index
    @todos = current_user.todos
  end

  def show
    todo = Todo.find(params[:todo_id])
    @task = todo.task
    @todos = Todo.where(task_id: @task.id, completed: true)
  end

  def update
    todo = Todo.find(params[:todo_id])
    todo.completed = !todo.completed
    todo.save
    redirect_to todos_path
  end


end

#def show
#    @todo = Todo.find(params[:id])
 #   @ranking5 = Todouser.limit(5).where(todo_id: @todo.id).order(created_at: :asc)
 #   @users_todo_finish = Todouser.all.where(todo_id: @todo.id).order(created_at: :asc)
#  end