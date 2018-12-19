class ReleaserModel
  def initialize(attrs_hash)
    @attributes = attrs_hash
  end

  def method_missing(method, *)
    @attributes.fetch(method) { super }
  end

  def respond_to_missing?(method, _include_all)
    @attributes.key?(method.to_sym)
  end

  def [](key)
    @attributes.fetch(key.to_sym)
  end
end