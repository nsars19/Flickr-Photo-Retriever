class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['flickr_key'], ENV['flickr_secret']
    @flickr_id = params[:flickr_user_id]
    @urls = []
    
    if @flickr_id
      @photos = flickr.people.getPhotos(user_id: @flickr_id, page: 1)

      @photos.each do |photo|
        photo_info = flickr.photos.getInfo(photo_id: photo.id)
        @urls << Flickr.url_n(photo_info)
      end
    end
  end
end
