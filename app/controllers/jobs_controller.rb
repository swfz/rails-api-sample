class JobsController < ApplicationController
  def sample
    SampleJob.perform_later(params[:text])
    render json: {result: 'OK'}
  end
end
