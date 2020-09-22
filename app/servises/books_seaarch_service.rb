class BookSearchService


  def initialize
  end

  def call
    init_collection
    sort_by_category
    filter
  end

  private

  def sort_by_category
    return if params[:category_id].blank?
  end

  def filter
    return if params[:filter].blank?
    return unless params [:filter].in?(Book::AVAIBLE_FILTERS)

    @books = @books.public_send(params[:filter])
  end
end
