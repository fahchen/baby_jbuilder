module BabyJbuilder
  class TemplateHandler
    def self.call(template)
      %{__already_defined = defined?(json); json ||= BabyJbuilder::Template.new;
        #{template.source}
        json.encode! unless (__already_defined && __already_defined != "method")}
    end
  end
end
