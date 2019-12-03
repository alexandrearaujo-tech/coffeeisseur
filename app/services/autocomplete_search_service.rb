class AutocompleteSearchService
  def initialize(params)
    @params = params
  end

  def call
    places
  end

  private

  def places
    Place.global_search(@params).take(5)
  end
end
