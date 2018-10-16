class LinksController < ApplicationController
  before_action :set_link, only: [:show]

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
      elsif @link.errors.messages[:og_url] == ['has already been taken']
        format.html { redirect_to Link.find_by(og_url: @link.og_url), notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: Link.find_by(og_url: @link.og_url) }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def url_redirect 
    link = Link.find_by_short_url(params[:short_url])
    if link.present?
      redirect_to "https://#{link.og_url}"
    else
      redirect_to root_path
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:og_url, :short_url)
    end
end
