module MarkItZero
  class Engine < ::Rails::Engine

    # Autoload the view helper
    initializer 'mark_it_zero.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper MarkItZero::EditorHelper
      end
    end

  end
end
