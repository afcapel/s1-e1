require 'twitter'

class TweetsController <  ApplicationController
  before_filter :authenticate_user!
  
  def reading
    @book = Book.find(params[:id])
    current_user.tweet("I'm reading #{@book.title}")
    flash[:notice] = "Message tweeted!"
    redirect_to @book
  end
  
  def like
    @book = Book.find(params[:id])
    current_user.tweet("I like #{@book.title}")
    flash[:notice] = "Message tweeted!"
    redirect_to @book
  end
end    