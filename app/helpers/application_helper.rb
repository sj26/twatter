module ApplicationHelper
  def default_application_name
    Rails.application.class.name.split('::').first
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

  def modular_controller_ancestor_names
    @modular_controller_ancestor_names ||= (controller.class.ancestors - [controller.class]).find_all { |klass| klass.name =~ /Controller$/ }.map { |klass| klass.name.sub(/Controller$/, "").underscore.dasherize }
  end

  def body_classes
    @body_classes ||= [
      classical_application_name.underscore.dasherize,
      modular_controller_name.parameterize,
      modular_controller_ancestor_names.map(&:parameterize),
      action_name.parameterize,
      [modular_controller_name, action_name].join('-').parameterize,
      ([modular_controller_name, action_name, params[:id]].join('-').parameterize if params[:id].present?),
    ].flatten.compact
  end
end
