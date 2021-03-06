RSpec::Matchers.define :have_property do |*expected|
  options       = expected.extract_options!
  property_name = expected.first
  coercion      = expected.second
  
  description {
    desc = "have"
    desc << " required" if options[:required]
    desc << " property :#{property_name}"
    desc << ", coerced to #{coercion}" if coercion
    desc << ", with default '#{options[:default]}'" if options.has_key?(:default)
    desc
  }
  
  match do |actual|
    property_exists = actual.class.properties.include?(property_name)
    
    default_matches = if options.has_key?(:default)
      actual.class.defaults[property_name] == options[:default]
    else
      true
    end
    
    required_matches = if options[:required]
      actual.class.required_properties.include?(property_name)
    else
      !actual.class.required_properties.include?(property_name)
    end
    
    coercion_matches = if coercion
      actual.class.key_coercion(property_name.to_sym) == coercion &&
      actual.class.key_coercion(property_name.to_s) == coercion
    else
      actual.class.key_coercion(property_name.to_sym).nil? &&
      actual.class.key_coercion(property_name.to_s).nil?
    end
    
    property_exists && default_matches && required_matches && coercion_matches
  end
end

RSpec::Matchers.define :serialize_to do |json|
  description { "serialize to JSON" }
  expected = ActiveSupport::JSON.decode(json)
  
  match do |object|
    actual = ActiveSupport::JSON.decode(object.to_json)
    actual == expected
  end
  
  failure_message_for_should do |object|
    actual = ActiveSupport::JSON.decode(object.to_json)
    "expected that #{object} would serialize to #{expected.pretty_inspect}Diff:#{RSpec::Expectations.differ.diff_as_object(actual, expected)}"
  end
end

RSpec::Matchers.define :deserialize_from do |json|
  description { "deserialize from JSON" }
  
  match do |object|
    new_object = object.class.from_json(json)
    new_object.is_a?(object.class) && new_object == object
  end
end

RSpec::Matchers.define :yaml_serialize_to do |yaml|
  description { "serialize to YAML" }
  expected = YAML.load(yaml)
  
  match do |object|
    actual = YAML.load(object.to_yaml)
    actual == expected
  end
  
  failure_message_for_should do |object|
    actual = YAML.load(object.to_yaml)
    "expected that #{object} would serialize to #{expected.pretty_inspect}Diff:#{RSpec::Expectations.differ.diff_as_object(actual, expected)}"
  end
end

RSpec::Matchers.define :yaml_deserialize_from do |yaml|
  description { "deserialize from YAML" }
  
  match do |object|
    new_object = YAML.load(yaml)
    new_object.is_a?(object.class) && new_object.eql?(object)
  end
end

RSpec::Matchers.define :act_as_array do |array_klass|
  match do |object|
    klass    = object.class
    actual   = [object]
    expected = array_klass.new([object.to_hash.deep_dup])
    
    actual == expected
  end
end

RSpec::Matchers.define :validate_associated do |attribute|
  match do |component|
    errors = double("#{component} errors", :empty? => false)
    
    attribute_double = double("#{component.class}.#{attribute}", {
      :errors => errors,
      :valid? => false,
      :present? => true,
      :blank? => false
    }).as_null_object
    
    component.stub(attribute => attribute_double)
    is_invalid = !component.valid?
    right_error_count = component.errors[attribute].size == 1
    
    is_invalid && right_error_count
  end
end
