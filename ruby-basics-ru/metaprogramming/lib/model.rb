# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.instance_variable_set(:@attributes, {})
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_reader :attributes

    def attribute(name, options = {})
      type = options[:type] || :string
      @attributes[name] = type

      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", convert_value(value, type))
      end
    end
  end

  def initialize(attributes = {})
    @attributes = attributes

    self.class.attributes.each do |name, type|
      value = attributes[name.to_sym]
      instance_variable_set("@#{name}", convert_value(value, type)) if value
      @attributes[name.to_sym] = convert_value(value, type) if value
    end
  end

  def attributes
    # if @attributes.empty?
    #   self.class.attributes.each do |name, type|
    #     value = @attributes[name.to_sym]
    #     puts value
    #     # @attributes[name.to_sym] = convert_value(value, type) if value
    #   end
    # else
      @attributes
    # end
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
