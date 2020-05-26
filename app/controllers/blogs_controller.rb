class BlogsController < ApplicationController
    skip_before_action :authorized

  def index
    if params[:category_id].present?
      @blogs = Blog.where(category_id: params[:category_id])
    else
      render 'pages/home'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

def create
  @blog = Blog.create(blog_params)

  if @blog.save
    redirect_to action: 'admin'
  else
    render :new
  end
end

  def edit
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :category_id, :main_photo)
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to action: 'admin'
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to :action => :index
  end

  def admin
    @blogs = Blog.all()
  end
end
