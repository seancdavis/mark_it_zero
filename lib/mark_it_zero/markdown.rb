require 'redcarpet'
require 'pygments.rb'

module MarkItZero

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  class Markdown

    @@renderer = Redcarpet::Markdown.new(
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

    def self.cleanse(text)
      return "" if text.blank?
      text.gsub(
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

    def self.to_html(text)
      @@renderer.render(cleanse(text))
    end

  end
end
