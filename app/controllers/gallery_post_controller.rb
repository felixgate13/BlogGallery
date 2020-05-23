class GalleryPostController < ApplicationController
  def index
    @GalleryPosts = GalleryPost.order(:sequence)
  end

  def new
    @GalleryPost = GalleryPost.new()
  end
  
  def create
    @GalleryPost = GalleryPost.create(gallery_post_params)
    
    if iterate_sequence(@GalleryPost, false)
      @GalleryPost.save
      redirect_to @GalleryPost
    end 
  end

  def edit
    @GalleryPost = GalleryPost.find(params[:id])
  end

  def update
    @GalleryPost = GalleryPost.find(params[:id])

    iterate_sequence(@GalleryPost, true)
    if @GalleryPost.update(gallery_post_params)
      redirect_to @GalleryPost
    else
      render :edit
    end
  end

  def gallery_post_params
    params.require(:GalleryPost).permit(:sequence, :image, :from_left, :name, :height)
  end

  def destroy
    @GalleryPost = GalleryPost.find(params[:id])
    @GalleryPost.destroy()

    redirect_to :action => :index

  end

# to be called before update/create to iterate all other sequences and update them
  def iterate_sequence(curGalleryPost, isupdate)

    #if sequence is blank add on the end this is a create
    if !curGalleryPost.attributes[sequence]
      curGalleryPost.attributes[sequence] = GalleryPost.count + 1
    end
    if isupdate
      itemsToReorder = GalleryPost.where("sequence >= ? ", curGalleryPost.sequence).order(:sequence)
      itemsToReorder.each do |i|
        i.sequence = i.sequence++ 
        i.update() 
    end
    end
  end

  def getCssString(gp)
    out = ""
    out << "left: " << gp.from_left << ";" << " height: " << gp.height << ";"
  end
  helper_method :getCssString
end
