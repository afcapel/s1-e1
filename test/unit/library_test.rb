require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
  
  should have_many(:books).through(:catalogations)
  
  def setup
    @library = libraries(:favourites)
  end
  
  test "should get some books on parsing" do
    @library.parse_feed
    assert @library.catalogations.size > 0, "Library should have some catalogations"
    assert @library.books.size > 0, "Library should have some books"
  end
  
  test "should have parsed a book by Milan Kundera'" do
    @library.parse_feed
    kunderas_book = Book.find_by_author('Milan Kundera')
    assert @library.books.include? kunderas_book
  end
  
  test "should assign library name" do
    @library.parse_feed
    assert @library.name == "Favorites"
  end
  
  test "should use correct tag for isbn" do
    @library.parse_feed
    kunderas_book = Book.find_by_author('Milan Kundera')
    assert kunderas_book.isbn == "ISBN:9509779660"
  end
  
end
