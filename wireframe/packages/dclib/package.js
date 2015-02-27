Package.describe({
  "version": "0.0.2",
  "name": "dcsan:dclib",
  "summary": 'dc library'
});

Package.on_use(function(api) {

  api.use([
    'coffeescript', 
    'underscore', 
    'iron:router',
    'dcsan:ribot',
  ]);

  api.use([
    'ui', 
  ], 'client' );

  // both
  api.addFiles([
    "lib/dclib.coffee"
  ]);

  // client
  api.addFiles([
    "client/global-ui-helpers.coffee"
  ], 'client' );

  api.export(['dclib']);

})
