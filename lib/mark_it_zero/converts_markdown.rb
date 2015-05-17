class << ActiveRecord::Base

  def converts_markdown(markdown = :markdown, html = :html)
    markdown = markdown.to_s
    html = html.to_s

    after_save :"convert_#{markdown}_to_#{html}"

    define_method "convert_#{markdown}_to_#{html}" do
      update_columns(
        html.to_sym => MarkItZero::Markdown.to_html(self.send(markdown))
      )
    end
  end

end
