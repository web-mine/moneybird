module Moneybird
  module Resource
    attr_reader :attributes
    attr_accessor :errors

    def initialize(client, attributes)
      @client = client
      self.attributes = attributes
    end

    def attributes=(attributes)
      @attributes = attributes
      attributes.each do |attribute, value|
        if respond_to?(writer = attribute.to_s + '=')
          send(writer, value)
        else
          raise "#{self.class} does not have an `#{attribute}' attribute"
        end
      end
    end

    def attributes
      self.class.attributes.inject({}) do |attributes, attribute|
        value = send(attribute)
        if !value.nil?
          if value.respond_to?(:attributes)
            attributes["#{attribute}_attributes"] = value.attributes
          else
            unless self.class.nillable_attributes && self.class.nillable_attributes.include?(attribute)
              attributes[attribute] = value
            end
          end
        end; attributes
      end
    end

    def to_json
      JSON.generate(attributes)
    end

    module ClassMethods
      attr_reader :attributes, :nillable_attributes

      def has_attributes(attributes)
        attr_accessor(*@attributes = attributes)
      end

      def has_nillable_attributes(attributes)
        @nillable_attributes = attributes
      end

      def has_boolean_attributes(attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            input = instance_variable_get('@' + attribute)
            if input.kind_of?(String)
              if input == 'true'
                true
              elsif input == 'false'
                false
              else
                nil
              end
            else
              input
            end
          end
        end
      end

      def has_integer_attributes(attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            input = instance_variable_get('@' + attribute)
            if input.kind_of?(String)
              input.to_i
            else
              input
            end
          end
        end
      end

      def has_datetime_attributes(attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            input = instance_variable_get('@' + attribute)
            if input.kind_of?(Time)
              input
            elsif input.kind_of?(Date)
              input.to_time
            elsif input.kind_of?(String)
              input.strip == '' ? nil : Time.parse(input)
            end
          end
        end
      end
    end
  end
end
