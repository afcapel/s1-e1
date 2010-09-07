class Catalogation < ActiveRecord::Base
  belongs_to :library
  belongs_to :book
  
  after_save :tweet_book
  
  private
  
  def tweet_book
    user = self.library.user
    user.tweet "#{book.title} added to library #{library.name}" if user.authenticated_with_twitter?
  end
end
