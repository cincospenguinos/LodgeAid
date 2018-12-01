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

  	if @meeting
      @brothers = Mason.all
      @attendees = Mason.joins(:meetings).where(meetings: { id: @meeting.id })
  	else
  		# TODO: Show 404 page
  	end
  end

  ## POST /meetings/:id
  def attendance
    # TODO: I'm not getting a brother_id from the request
    # byebug
    @meeting = Meeting.find_by(id: params[:id])
    @brother = Mason.find_by(id: params[:mason].to_i)
    @attending = (params[:attending] == 'true')

    if @meeting && @brother
      @attending ? @meeting.masons << @brother : @meeting.masons.delete(@brother)
      render json: { success: true, message: '' }
    else
      render json: { success: false, message: 'Could not find brother or meeting'}
    end
  end

  ## DELETE /meetings/:id
  def destroy
  end

  private
end
