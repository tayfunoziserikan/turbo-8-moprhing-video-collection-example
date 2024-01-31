class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show edit update destroy ]

  # GET /collections
  def index; end

  # GET /collections/1
  def show

  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to collection_url(@collection), notice: "Collection was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collection_url(@collection), notice: "Collection was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Collection was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:title, :cover_picture, :creator_name)
    end
end
