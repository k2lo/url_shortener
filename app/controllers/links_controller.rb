class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def url_redirect 
    link = Link.find_by_short_url(params[:short_url])
    redirect_to "https://#{link.og_url}"
  end
  

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:og_url, :short_url)
    end
end
