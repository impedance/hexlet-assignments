class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  #   @user = User.find params[:id]
  #
  #   @tasks = @user.tasks
  end

  def new
    @task = Task.new
    @users = User.all
    @statuses = Status.all
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find params[:id]
  end
end
  #
  # def update
  #   @user = User.find params[:id]
  #
  #   if @user.update(user_params)
  #     redirect_to @user, notice: 'User was successfully updated.'
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end
  #
  # def destroy
  #   @user = User.find params[:id]
  #
  #   @user.destroy
  #
  #   redirect_to users_url, notice: 'User was successfully destroyed.'
  # end
  #
  # private
  #
  # # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description, :user_id, :status_id)
  end
