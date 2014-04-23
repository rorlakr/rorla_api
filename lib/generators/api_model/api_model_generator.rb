class ApiModelGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :name, type: :string, required: true
  argument :attributes, type: :array, required: false

  def generate_model 
    Rails::Generators.invoke("active_record:model", ["#{model_name}", attributes, "--no-test-framework"], behavior: behavior)
    Rails::Generators.invoke("factory_girl:model", ["#{model_name}", attributes], behavior: behavior)
    template "api_model_spec.rb", "spec/models/#{model_name}_spec.rb"
  end

  private

  def model_name
    name.underscore
  end

  def model_class
    model_name.capitalize
  end

end
