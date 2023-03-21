class TodosController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
  	byebug
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: { errors: todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end
