class GalleryPostsController < ApplicationController
  
  skip_before_action :authorized, only: [:index]

  def index
    @GalleryPosts = GalleryPost.order(:sequence)
  end

  def new
    @GalleryPost = GalleryPost.new()
  end
  
  def create
    @GalleryPost = GalleryPost.create(gallery_post_params)
    @GalleryPost = get_GP_with_seq(@GalleryPost)
    
    if iterate_sequence(@GalleryPost)
      @GalleryPost.save
      render :index
    end 
  end

  def edit
    @GalleryPost = GalleryPost.find(params[:id])
  end

  def update
    @GalleryPost = GalleryPost.find(params[:id])
    @GalleryPost = get_GP_with_seq(@GalleryPost)

    iterate_sequence(@GalleryPost)
    if @GalleryPost.update(gallery_post_params)
      render :index
    else
      render :edit
    end
  end

  def gallery_post_params
    params.require(:gallery_post).permit(:sequence, :image, :from_left, :name, :height)
  end

  def destroy
    @GalleryPost = GalleryPost.find(params[:id])
    @GalleryPost.destroy()

    redirect_to :action => :index

  end


  def get_GP_with_seq(curGalleryPost)
    if !curGalleryPost.sequence? 
      curGalleryPost.sequence = GalleryPost.count + 1
    end

    curGalleryPost
  end

# to be called before update/create to iterate all other sequences and update them
  def iterate_sequence(curGalleryPost)
      itemsToReorder = GalleryPost.where("sequence >= ? ", curGalleryPost.sequence).order(:sequence)
      itemsToReorder.each do |i|
        i.sequence = i.sequence++ 
        i.update() 
    end
  end

  def getCssString(gp)
    imageUrl = url_for(gp.image)

    out = ""
    out << "left: " << gp.from_left << "%; height: " << gp.height << "px; position: relative; display: block;"
    out <<  "background-image:url(" << imageUrl  << "); background-size: contain; background-repeat: no-repeat; background-position: 50% 50%;"
  end
  helper_method :getCssString
end
