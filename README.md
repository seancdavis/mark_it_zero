Mark It Zero!
==========

![Mark it zero!](http://i296.photobucket.com/albums/mm163/pacersfan33/biglebowski-markitzero-1.jpg)

Mark It Zero! adds a markdown editor (with syntax highlighting) to your Rails'
forms, and can automatically convert markdown to HTML on save.

The editor we're using is almost entirely [this fantastic javascript
editor](https://github.com/lepture/editor) by Hsiaoming Yang. The converter
uses [Redcarpet](https://github.com/vmg/redcarpet) and
[Pygments.rb](https://github.com/tmm1/pygments.rb).

Installation
----------

This gem is meant to work with Ruby on Rails projects. I recommend you add it
to your project's Gemfile:

```ruby
gem 'mark_it_zero'
```

Then install your bundle:

```text
$ bundle
```

Usage
----------

There are two main pieces to this gem:

* markdown editor
* markdown-to-html converter

They are not dependent on one another, and can be used separately.

### Markdown Editor

To use the markdown editor, first make sure you have the assets included in
your manifest file.

You'll want styles:

```scss
@import 'mark_it_zero';
```

And scripts:

```js
//= require jquery
//= require mark_it_zero
```

> Note: Mark It Zero! automatically requires jQuery, so if you forget, it
> will still work fine (magic!).

The markdown editor is simple. There's a `markdown` method added onto your form
object. So, all you have to do is this:

```text
<%= [form_object].markdown :[markdown_column] %>
```

So, if your markdown column is, for example, `body_markdown`, and your form
object is `f`, then this would look like:

```html
<%= f.markdown :body_markdown %>
```

Easy, right?

### Converting to HTML

Mark It Zero! adds some instance methods to your model if you want to store
both the markdown and HTML.

> *I prefer to store both markdown and HTML because then the markdown is only
> parsed on save (which can be time-consuming), as opposed to every read.*

All you have to do is add the `converts_markdown` method to your model.

```ruby
converts_markdown :[markdown_column], :[html_column]
```

For example, if I have a `Post` model that has a `body_markdown` and a
`body_html` column for storing markdown and html, my model might look like
this:

```ruby
class Post < ActiveRecord::Base
  converts_markdown :body_markdown, :body_html
end
```

Whenever you use this method, you get a set of methods (dynamically named)
available to you. Using this example, you would get the following methods:

* `convert_body_markdown_to_body_html`: Will update the `body_markdown` column
  with the converted html from the `body_markdown` column.
* `clean_body_markdown`: The `markdown_body` value, after being cleaned.

Notice the pattern. If the columns were simple `md` and `html`, then the
methods would be `convert_md_to_html` and `clean_md`.

The converter is run using the `after_save` callback.

#### Features

**YouTube Videos**

Having a YouTube URL as a paragraph in markdown will convert the URL to an
embedded video.

**Syntax Highlighting**

We use Pygments.rb to add classes for syntax highlighting to code blocks. Most
of what I'm doing is contained within [this
Railscast](http://railscasts.com/episodes/207-syntax-highlighting-revised).

### Without Active Record

You can use Mark It Zero! without ActiveRecord. Just use the `Markdown` class'
`to_html` method.

```ruby
MarkItZero::Markdown.to_html("# Heading 1\n\n> A really cool quote ...")
# => "<h1 id=\"heading-1\">Heading 1</h1>\n\n<blockquote>\n<p>A really cool quote ...</p>\n</blockquote>\n"
```

Special Thanks!
----------

The bulk of this gem is piecing together fantastic work by the individuals who
built [the editor](https://github.com/lepture/editor),
[Redcarpet](https://github.com/vmg/redcarpet), and
[Pygments.rb](https://github.com/tmm1/pygments.rb).

Thanks for all your hard work! It makes my job easier.

Contributing
----------

1. Fork it ( https://github.com/[my-github-username]/cambium/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
