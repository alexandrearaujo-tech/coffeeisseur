class AutocompleteSearchService
  def initialize(params)
    @params = params
  end

  def call
    { places: places.as_json(only: %i[name city street]) }
  end

  private

  def places
    Place.global_search(@params).take(5)
  end
end
