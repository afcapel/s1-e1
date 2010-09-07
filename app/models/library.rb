require 'open-uri'

class Library < ActiveRecord::Base
  has_many :catalogations
  has_many :books, :through => :catalogations
  belongs_to  :user
  
  def parse_feed
    @xml = Nokogiri::XML(open(self.url))
    entries = @xml.xpath('//xmlns:entry', 'xmlns' => 'http://www.w3.org/2005/Atom')
    entries.each do |entry|
      book = parse_entry(entry)
      self.books << book unless self.books.include? book
    end
  end
  
  private
  
  def parse_entry(entry)
    isbn = entry.at_xpath("dc:identifier[starts-with(text(), 'ISBN')]").text
    book = Book.find_or_initialize_by_isbn(isbn)
    book.title = entry.at_xpath('dc:title').text
    book.author = entry.at_xpath('dc:creator').text
    book.save!
    book
  end
end
