class TasksController < ApplicationController
    load_and_authorize_resource
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to project_path(@task.project_id), notice: 'Successfully created the task'
        end
    end

    def mark_as_complete
        task = Task.find(params[:task_id])
        task.update_attributes(is_complete: true)
        Notification.completed(task, current_user).deliver!
        redirect_to :back, notice: 'Successfully completed the task'
    end

    def mark_as_incomplete
        task = Task.find(params[:task_id])
        task.update_attributes(is_complete: false)
        Notification.completed(task, current_user).deliver!
        redirect_to :back, notice: 'Task Is Been ReOpened'
    end

    private

    def task_params
        params[:task].permit(:title, :due_date, :project_id, :is_complete)
    end
end
