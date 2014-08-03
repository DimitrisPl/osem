class ConferenceController < ApplicationController
  def show
    @conference = Conference.find_by_short_title(params[:id])
    redirect_to root_path, notice: "Conference not ready yet!!" unless @conference.make_conference_public?
  end

  def gallery_photos
    @photos = Conference.find_by_short_title(params[:id]).photos
    render "photos", formats: [:js]
  end
end
