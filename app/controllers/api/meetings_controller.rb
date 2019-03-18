class Api::MeetingsController < ApplicationController
  def index
    if params[:search]
      @meetings = Meeting.where("name iLIKE ?", "%#{params[:search]}%")
    else
      @meetings = Meeting.all
    end
    render 'index.json.jbuilder'
  end

  def show
    @meeting = Meeting.find(params[:id])
    render 'show.json.jbuilder'
  end
end
