Package.describe({
  "summary": 'layout utils',
  "version": "0.0.1",
  "name": "dcsan:layout"
});

Package.on_use(function(api) {
    console.log('-- layout.on_use')

    // use CLIENT
    api.use([
      'templating',
      'ui',
      'stylus',
      'mquandalle:jade',
    ], 'client');


    // client
    api.addFiles([
      'client/shared/games.styl',
      'client/shared/buttons.styl',
    ], 'client');

});