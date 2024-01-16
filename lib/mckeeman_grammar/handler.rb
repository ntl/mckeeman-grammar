module McKeemanGrammar
  module Handler
    def self.included(cls)
      cls.class_exec do
        extend HandleMacro

        ## Use virtual or template-method - Nathan, Tue Jan 16 2024
        # include Virtual
        #
        # virtual :handle_match
      end
    end

    def handle(match)
      handled = false

      handler_method = handler_method(match)
      if not handler_method.nil?
        method = method(handler_method)

        if not method.arity.zero?
          method.(match)
        else
          method.()
        end

        handled = true
      end

      if respond_to?(:handle_match)
        handle_match(match)

        handled = true
      end

      handled
    end

    def handle?(match)
      handler_method = handler_method(match)

      if not handler_method.nil?
        true
      else
        respond_to?(:handle_match)
      end
    end

    def handler_method(match)
      rule_name = match.rule_name

      method_name = self.class.handler_method_name(rule_name)

      if respond_to?(method_name)
        method_name
      else
        nil
      end
    end

    module HandleMacro
      def handle_macro(rule_name, &block)
        handler_method_name = handler_method_name(rule_name)

        define_method(handler_method_name, &block)
      end
      alias :handle :handle_macro

      def handler_method_name(rule_name)
        HandleMacro.handler_method_name(rule_name)
      end

      def self.handler_method_name(rule_name)
        :"handle_#{rule_name}"
      end
    end
  end
end
