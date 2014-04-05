require "rubygems"
require "sinatra"
require "sinatra/assetpack"


assets do
  serve '/js', :from => 'js'
  serve '/bower_components', :from => 'bower_components'

  js :modernizr, [
    '/bower_components/modernizr/modernizr.js',
  ]

  js :libs, [
    '/bower_components/jquery/dist/jquery.js',
    '/bower_components/foundation/js/foundation.js'
  ]

  js :application, [
    '/js/app.js'
  ]

  js_compression :jsmin
end


get '/' do
  erb :index
end


__END__

@@ layout

<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My App</title>
  <link rel="stylesheet" href="/stylesheets/app.css"/>

  <%= js :modernizr %>
</head>
<body>
  <%= yield %>

  <%= js :libs %>
  <%= js :application %>
</body>
</html>


@@ index
Hi
