require 'rails/railtie'
require 'baby_jbuilder/template_handler'

module BabyJbuilder
  class Railtie < ::Rails::Railtie
    initializer :baby_jbuilder do
      ActiveSupport.on_load :action_view do
        ActionView::Template.register_template_handler :baby_jbuilder, BabyJbuilder::TemplateHandler
        ActionView::Template.register_template_handler :bjbuilder, BabyJbuilder::TemplateHandler
      end
    end
  end
end
