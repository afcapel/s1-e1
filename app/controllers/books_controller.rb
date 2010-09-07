class BooksController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  
  def index
    @books = Book.all
    respond_with @books
  end

  def show
    @book = Book.find(params[:id])
    respond_with @book
  end
end
