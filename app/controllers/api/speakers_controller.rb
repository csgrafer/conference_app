class Api::SpeakersController < ApplicationController
  def index
    if params[:search]
      @speakers = Speaker.where("last_name iLIKE ?", "%#{params[:search]}%")
    else
      @speakers = Speaker.all
    end
    render 'index.json.jbuilder'
  end

  def show
    @speaker = Speaker.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @speaker = Speaker.new(
      id: params[:id],
      title: params[:title],
      agenda: params[:agenda],
      time: params[:time],
      location: params[:location],
      remote: params[:remote]
    )
    if @speaker.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def update
    @speaker = Speaker.find(params[:id])

    @speaker.first_name = params[:first_name] || @speaker.first_name
    @speaker.last_name = params[:last_name] || @speaker.last_name
    @speaker.email = params[:email] || @speaker.email
    @speaker.gender = params[:gender] || @speaker.gender
    @speaker.age = params[:age] || @speaker.age

    if @speaker.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end
end
