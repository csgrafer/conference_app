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

  def create
    @meeting = Meeting.new(
      id: params[:id],
      title: params[:title],
      agenda: params[:agenda],
      time: params[:time],
      location: params[:location],
      remote: params[:remote]
    )
    if @meeting.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def update
    @meeting = Meeting.find(params[:id])

    @meeting.title = params[:title] || @meeting.title
    @meeting.agenda = params[:agenda] || @meeting.agenda
    @meeting.time = params[:time] || @meeting.time
    @meeting.location = params[:location] || @meeting.location
    @meeting.remote = params[:remote] || @meeting.remote

    if @meeting.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end
end
