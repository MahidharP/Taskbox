class SandboxController < ApplicationController
    def client
        @client = Client.all
        # @clien = Client.find(3)
        # @client_by_id = Client.find(1,3)
    end

    def projects
        @projects = Project.all
      # @projects = Project.order('start_date') #ascending order
      # @projects = Project.order('start_date DESC') #descending order
      # @projects = Project.order('start_date DESC').limit(5)  #Shows last recent ones
      # @projects = Project.order('name') #sorts with the name.
  end

    def task
        @task = Task.all
        @complete_task = Task.where('is_complete = ?', true)
        @incomplete_task = Task.where('is_complete = ? AND due_date >= ?', false, Date.today)
        @over_due_task = Task.where('due_date < ? AND is_complete = ?', Date.today + 1.month, false)
    end

    def job_results
        technology = params[:technology]
        location = params[:location]
        response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{technology}&co=india&l=#{location}&format=json&v=2")
        @job_results = response.parsed_response
    end
end
