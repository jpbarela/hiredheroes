class JobsController < ApplicationController

  def index
    zip_code = params[:zip_code]
    @moc_code = MocCode.find(params[:moc_code]) 
    @jobs = Job.find_by_moc_code_and_zip_code(@moc_code, @zip_code )
  end

end
