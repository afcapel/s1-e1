require 'twitter'

class TweetsController <  ApplicationController
  before_filter :authenticate_user!
  
  def reading
    @book = Book.find(params[:id])
    tweet "I'm reading #{@book.title}"
    flash[:notice] = "Message tweeted!"
    redirect_to @book
  end
  
  def like
    @book = Book.find(params[:id])
    tweet "I like #{@book.title}"
    flash[:notice] = "Message tweeted!"
    redirect_to @book
  end
  
  private
  
  def tweet(message)
    oauth = Twitter::OAuth.new(APP_CONFIG['token'], APP_CONFIG['secret'])
    oauth.authorize_from_access(current_user.oauth_token, current_user.oauth_secret)

    client = Twitter::Base.new(oauth)
    client.update(message)
  end
end    