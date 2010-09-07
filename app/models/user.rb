class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :libraries
  
  def authenticated_with_twitter?
    oauth_token.present? && oauth_secret.present?
  end
  
  def tweet(message)    
    oauth = Twitter::OAuth.new(APP_CONFIG['token'], APP_CONFIG['secret'])
    oauth.authorize_from_access(self.oauth_token, self.oauth_secret)

    client = Twitter::Base.new(oauth)
    client.update(message)
  end
end
