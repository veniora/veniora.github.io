###
# Page options, layouts, aliases and proxies
###
page "CNAME", layout:false

set :css_dir, 'assets/bootstrap/css'
set :js_dir, 'assets/bootstrap/js'

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Define the layout to use for the index page
page "/index.html", layout: :index_layout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "post/{title}.html"
  # Matcher for blog source files
  blog.sources = "content/posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "article_layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Run when 'middleman build'
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  
  activate :minify_html
#   activate :imageoptim (not working in 4.0 yet)
  
  activate :relative_assets
  activate :gzip
end

# Pretty URLs
activate :directory_indexes

# activate :bootstrap_navbar

# Deploy to gh-pages
# activate :deploy do |deploy|
#   deploy.method = :git
#   deploy.build_before = true
# end