class LogsController < ApplicationController

  def index
    @page = params[:page] || 1
    @log = Log.paginate(:page => params[:page], :per_page =>5)
  end
end
