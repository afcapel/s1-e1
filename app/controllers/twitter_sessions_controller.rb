class TwitterSessionsController <  ApplicationController
  before_filter :authenticate_user!
  
  def new
    oauth = Twitter::OAuth.new(APP_CONFIG['token'], APP_CONFIG['secret'])
    request_token = oauth.request_token(:oauth_callback => APP_CONFIG['oauth_callback'])
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end
  
  def create
    oauth = Twitter::OAuth.new(APP_CONFIG['token'], APP_CONFIG['secret'])
    current_user.oauth_token, current_user.oauth_secret = oauth.authorize_from_request(params[:oauth_token], session[:request_token_secret], params[:oauth_verifier])
    
    current_user.save!
    redirect_to profile_url
  end
end