class ApiControllerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :name, type: :string, default: "apicontroller"

  def generate_controller
    template "api_controller.rb", "app/controllers/#{controller_name}_controller.rb"
    template "api_controller_spec.rb", "spec/controllers/#{controller_name}_controller_spec.rb"
  end
  
  private
  
  def controller_name
    name.underscore
  end

  def controller_class
    controller_name.capitalize + "Controller"
  end

  def model_name
    controller_name[0...-1]
  end

  def model_class
    model_name.capitalize
  end
end
