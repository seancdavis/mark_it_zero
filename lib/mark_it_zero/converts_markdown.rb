require 'redcarpet'
require 'pygments.rb'

class << ActiveRecord::Base

  def converts_markdown(markdown = :markdown, html = :html)
    markdown = markdown.to_s
    html = html.to_s

    after_save :"convert_#{markdown}_to_#{html}"

    define_method "convert_#{markdown}_to_#{html}" do
      renderer = Redcarpet::Markdown.new(
        HTMLwithPygments.new(:hard_wrap => false, :with_toc_data => true),
        {
          :autolink => true,
          :fenced_code_blocks => true,
          :highlight => true,
          :space_after_headers => true,
          :strikethrough => true,
          :tables => true,
          :underline => true,
        }
      )

      update_columns(
        html.to_sym => renderer.render(self.send("clean_#{markdown}"))
      )
    end

    define_method "clean_#{markdown}" do
      md = self.send(markdown)
      return "" if md.blank?
      md.gsub(
        /(?:http[s]?:\/\/)?(?:www\.)?(?:youtu\.be)\/(?:watch\?v=)?(.+)/,
        '<iframe width="420" height="345" src="http://www.youtube.com/embed/\1" frameborder="0" allowfullscreen></iframe>'
      ).gsub(
        /[”“]/,
        '"'
      ).gsub(
        /\[file\:(.*)\]/,
        '<p class="file"><code>\1</code></p>'
      )
    end
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

end
