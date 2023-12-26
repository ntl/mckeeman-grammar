module McKeemanGrammar
  module Controls
    module Rule
      def self.name
        Name.example
      end

      module Name
        def self.example
          :some_rule
        end

        def self.random
          suffix = Random.string

          :"#{example}_#{suffix}"
        end
      end
    end
  end
end
