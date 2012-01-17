module ApplicationHelper
  def default_application_name
    @default_application_name ||= Rails.application.class.name.split('::').first
  end

  def application_name
    @application_name ||= t :application_name, :default => proc { default_application_name.titleize }
  end

  def classical_application_name
    @classical_application_name ||= default_application_name.underscore.dasherize
  end

  def modular_controller_name
    @modular_controller_name ||= controller.class.name.sub(/Controller$/, '').underscore.dasherize
  end

  def body_classes
    @body_classes ||= [
      classical_application_name.underscore.dasherize,
      "#{modular_controller_name.parameterize}-controller",
      "#{modular_controller_name.parameterize}-#{action_name.parameterize}-action"
    ].flatten.compact
  end
end
