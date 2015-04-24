module MarkItZero
  module EditorHelper

    ActionView::Helpers::FormBuilder.class_eval do
      def markdown(conf, *opts)
        self.text_area(conf, :class => 'mark-it-zero')
      end
    end

  end
end
