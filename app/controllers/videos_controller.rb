class VideosController < ApplicationController
  before_action :set_collection
  before_action :set_video, only: %i[ show edit update destroy ]

  def index
    @videos = @collection.videos
  end

  def show
  end

  def new
    @video = @collection.videos.build
  end

  def edit

  end

  def create
    @video = @collection.videos.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to collection_url(@collection), notice: "Video was successfully created." }
      else
        format.html { redirect_to collection_url(@collection), notice: "Video not created." }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to collection_url(@collection), notice: "Video was successfully updated." }
        format.turbo_stream
      else
        format.html { redirect_to collection_url(@collection), error: "Video not updated." }
      end
    end
  end

  def destroy
    @video.destroy!

    respond_to do |format|
      format.html { redirect_to collection_url(@collection), notice: "Video was successfully destroyed."}
    end
  end

  private
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    def set_video
      @video = @collection.videos.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :tags, :embed_code, :watched)
    end
end
