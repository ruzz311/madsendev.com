require.config
  shim : {},

  paths :
    hm      : 'vendor/hm'
    esprima : 'vendor/esprima'
    jquery  : 'vendor/jquery.min'
 
require ['app'], (app)->
  
  # use app here
  console.log app
  