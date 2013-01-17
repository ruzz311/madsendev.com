require.config
  shim : {},

  paths :
    hm      : 'vendor/hm'
    esprima : 'vendor/esprima'
    jquery  : 'vendor/jquery.min'
 
require ['app'], (app)->
  
  # use app here
  console.log app
  
  $('.btn').click ()->
    $russell = $('.russell')
    $feed = $('.feed');
    
    t1 = if $russell.hasClass('fadeInDownBig') then 300 else 0
    t2 = if $feed.hasClass('fadeInDownBig')    then 0 else 200
    
    setTimeout ()->
        $russell.toggleClass('fadeInDownBig fadeOutUpBig')
      , t1
      
    setTimeout ()-> 
        $feed.toggleClass('fadeInUpBig fadeOutDownBig')
      , t2