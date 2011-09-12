class LinksController < ApplicationController
  respond_to :html, :xml, :json
  def index
    @links = Link.order('created_at DESC').page(params[:page])
    respond_with @links
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to links_url
    else
      render :action => :new
    end
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def destroy
    Link.delete(params[:id])    
    flash[:notice] = "Link #{params[:id]} deleted"
    redirect_to links_url
  end
end
