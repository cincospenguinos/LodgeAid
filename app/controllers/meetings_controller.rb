class MeetingsController < ApplicationController
	## GET /meetings
  def index
  	@meetings = Meeting.all
  end

  ## POST /meetings
  def create
  end

  ## GET /meetings/:id
  def show
  	@meeting = Meeting.find_by(id: params[:id])
  	@brothers = Mason.where(meetings: [@meeting])

  	if @meeting

  	else
  		# TODO: Show 404 page
  	end
  end

  ## POST /meetings/:id
  def attendance
  	# TODO: Handle attendance. Should be via AJAX
  end

  ## DELETE /meetings/:id
  def destroy
  end

  private
end
