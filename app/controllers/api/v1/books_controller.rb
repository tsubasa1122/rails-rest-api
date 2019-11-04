class Api::V1::BooksController < ApplicationController
  before_action :load_book, only: :show

  def index
    @books = Book.all.includes(:reviews)
    book_serializers = parse_json(@books)
    json_response("Index books successfully", true, {books: book_serializers}, :ok)
  end

  def show
    book_serializer = parse_json(@book)
    json_response("show book successfully", true, {book: book_serializer}, :ok)
  end

  private

  def load_book
    @book = Book.find(params[:id])
    unless @book.present?
      json_response("Can not get book", false, {}, :not_found)
    end
  end
end