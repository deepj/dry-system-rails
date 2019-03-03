Dry::System::Container.class_eval do
  def require_component(component)
    return if key?(component.identifier)

    unless component.file_exists?(load_paths)
      raise FileNotFoundError, component
    end

    require_dependency component.path

    yield
  end
end
