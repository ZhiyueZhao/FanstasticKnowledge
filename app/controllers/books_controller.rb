class BooksController < ApplicationController

  def index
    @types = Type.all
    @statuses = Status.all

    @selected_type = params[:type]
    @selected_status = params[:status]

    if (params[:type] == '' || params[:type] == nil) && (params[:status] == '' || params[:status] == nil)
      @books = Book.search_by_name(params[:search]).page(params[:page]).per(3)
    else
      @books = Book.search_by_name(params[:search]).search_by_type(params[:type])
      .search_by_status(params[:status]).page(params[:page]).per(3)
    end

  end

  def show
    @book = Book.find(params[:id])
  end

  def aboutus
    @about = AboutU.last
  end
end
