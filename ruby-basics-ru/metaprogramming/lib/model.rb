# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.instance_variable_set(:@attr_options, {})
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_reader :attr_options

    def attribute(name, options = {})
      type = options[:type] || :string
      @attr_options[name] = type

      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", convert_value(value, type))
      end
    end
  end

  def initialize(init_attrs = {})
    @init_attrs = init_attrs

    self.class.attr_options.each do |name, type|
      value = init_attrs[name.to_sym]
      instance_variable_set("@#{name}", convert_value(value, type)) if value
      @init_attrs[name.to_sym] = convert_value(value, type) if value
    end
  end

  def attributes
    @init_attrs
  end

  private

  def convert_value(value, type)
    case type
    when :integer
      value.to_i
    when :datetime
      DateTime.parse(value.to_s)
    when :boolean
      [true, "true", 1, "1"].include?(value)
    else
      value
    end
  end
end
# END
