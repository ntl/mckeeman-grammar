module McKeemanGrammar
  module Controls
    module Pattern
      module Alternative
        def self.example(*items)
          if items.empty?
            items = self.items
          end

          McKeemanGrammar::Pattern::Alternative.build(*items)
        end

        def self.items
          ["some", (0..), "sequence"]
        end

        module String
          module Match
            def self.example
              "some-sequence"
            end
          end

          module NoMatch
            def self.example
              "some-other-sequence"
            end
          end
        end
      end
    end
  end
end
