class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed (task,user)
    @task = task
    @user = user

    mail to: "#{task.project.client.email}", cc: "#{user.email}", subject: "#{task.title} has been completed!"
  end
def incomplete(task,user)
  @task = task
  @user = user
  mail to: "#{task.project.client.email}", cc: "#{user.email}", subject: "#{task.title} has Opened again!"
end 
end

