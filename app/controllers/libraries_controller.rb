class LibrariesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_library, :except => [:index, :new, :create]
  respond_to :html
  
  def index
    @libraries = current_user.libraries
    respond_with @libraries
  end
  
  def show
    respond_with @libraries
  end

  def new
    @library = Library.new
     respond_with @library
  end

  def edit
  end

  def create
    @library = Library.new(params[:library])
    @library.user_id = current_user.id
    @library.parse_feed
    @library.save!
    respond_with @library
  end

  def update
    @library = Library.find(params[:id])
    respond_with @library
  end


  def destroy
    @library.destroy
    redirect_to(libraries_url)
  end
  
  def update_feed
    @library.parse_feed
    respond_with @library
  end
  
  private
  
  def set_library
    @library = current_user.libraries.find(params[:id])
  end
    
end
