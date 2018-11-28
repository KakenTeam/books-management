module BooksHelper
  def current_book
    Book.friendly.find(session[:book_id])
  end
end
