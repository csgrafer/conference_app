class Api::SpeakersController < ApplicationController
  def index
    if params[:search]
      @speakers = Speaker.where("name iLIKE ?", "%#{params[:search]}%")
    else
      @speakers = Speaker.all
    end
    render 'index.json.jbuilder'
  end

  def show
    @speaker = Speaker.find(params[:id])
    render 'show.json.jbuilder'
  end
end
