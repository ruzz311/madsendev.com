define [], ->
  
  # View Toggle
  $('.btn').click ()->
    
    $russell  = $('.russell')
    $feed     = $('.feed')
    
    t1 = if $russell.hasClass('fadeInDownBig') then 400 else 0
    t2 = if $feed.hasClass('fadeInDownBig')    then 0 else 200
    
    setTimeout ()->
        $russell.toggleClass('fadeInDownBig fadeOutUpBig')
      , t1
    setTimeout ()-> 
        $feed.toggleClass('fadeInUpBig fadeOutDownBig')
      , t2
  
  jqxhr = $.getJSON "http://localhost:3000/tumblr/posts?callback=?", ()->
    console.log "/tumblr/posts", arguments
  
  # Set another completion function for the request above
  jqxhr.complete ()-> console.log "complete", arguments
  
  return 'Hello from Yeoman!'