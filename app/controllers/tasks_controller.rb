class TasksController < BaseController

  expose(:tasks) { Task.all.includes(:reporter, :implementer, :employer) }
  expose(:task) { Task.find(params[:id]) }

	def index
	end

  def create
    create_params = task_params
    create_params[:assigned_by] = current_user.id if create_params[:assigned_to]
    self.task = Task.create!(create_params.merge(reporter: current_user))
    render 'show'
  end

  def update
    update_params = task_params
    update_params[:assigned_by] = current_user.id if update_params[:assigned_to]
    task.update!(update_params)
    render 'show'
  end

  def destroy
    task.destroy!
    render 'show'
  end

  private

  def task_params
    params.permit(:title, :description, :status, :assigned_to, :rating)
  end
end