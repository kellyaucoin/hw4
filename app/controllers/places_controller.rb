class PlacesController < ApplicationController

  def index
    @places = Place.where({ "user_id" => session["user_id"] })
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user["id"]})
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place.save
    end
    
    redirect_to "/places"
  end

  def destroy
    @place = Place.find_by({ "id" => params["id"] })
    if @place["user_id"] == @current_user["id"]
      @place.destroy
    end

    redirect_to "/places"
  end


end
