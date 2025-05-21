class WorkerJobsController < ApplicationController
  before_action :authenticate_user!

  def create
    WorkerJob.perform_async(current_user.email)
    render json: { status: "ok" }
  end
end
