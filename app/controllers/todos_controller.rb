class TodosController < ApplicationController

  def list
    render json: Todo.all
  end

  def show
    username = session[:username]
    if username
      render json: Todo.all
    else
      render json: { message: "unauthorized" }, status: :unauthorized
    end
  end

  def create
    username = cookies[:username]
    if username
      todo = Todo.create(todo_params)
      if todo.valid?
        render json: todo
      else
        render json: todo.errors
      end
    else
      render json: { message: "You are not logged in" }, status: :unauthorized
    end
  end

  def update
    id = params[:id]
    todo = Todo.find(id.to_i)
    todo.update(todo_params)
    render json: { success: "Updated todo params successfully" }
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id.to_i)
    todo.destroy
    render json: { success: "Deleted todo successfully" }
  end

  private

  def todo_params
    params.permit(:title, :description, :priority, :status)
  end
end
