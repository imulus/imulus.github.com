#= require lib/jquery-1.6.2.min.js
#= require jquery/jquery.yql.js




$ ->
  $container  = $('#container')
  $section    = $('<div class="section repo autoclear" />')

  $.yql "SELECT * from github.user.repos where id='imulus'",
    (data) ->
      $(data.query.results.repositories.repository).each ->
        name = "<span>#{this.name}</span> "
        link = "<a href='#{this.url}'>#{this.url}</a>"
        $repo = $section.clone().hide().html name + link
        $container.prepend $repo
        $repo.delay(1000).fadeIn()
