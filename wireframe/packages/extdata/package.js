Package.describe({
  "version": "0.0.1",
  "name": "dcsan:extdata",
  "summary": 'wrapper for loading external data from gdocs or yaml'
});


Package.on_use(function(api) {
  
  console.log("-- airtable.use")
  
  api.versionsFrom('1.0');

  // use server
  api.use([
    'coffeescript', 
    'underscore', 
    'iron:router',
    'meteorhacks:npm',
    'meteorhacks:async',
    'udondan:yml',
    'http'
  ],'server');

  // use client
  api.use([
    'mquandalle:jade',
    'ui',
    'templating',
    'stylus',
  ], 'client');


  // add server
  api.addFiles([
    'lib/ExtData.coffee',
  ], ['server']);

  // both
  // api.addFiles([
  //   'both/inboxRoutes.coffee'
  // ]);

  api.export(['ExtData'], ['server']);
})



// Package.on_test(function (api) {

//   api.use([
//     'tinytest',
//     'coffeescript', 
//     'underscore', 
//     // 'dcsan:ribot'
//   ]);

//   // both
//   api.addFiles([
//     // 'lib/MsgParser.coffee'
//   ], 'client');

//   // // server
//   // api.addFiles([
//   // ], ['server']);

//   // // use client
//   // api.use([
//   // ], 'client');


//   // reference the application files you want to test
//   // api.add_files('tests/MsgParser.coffee', 'client');


// });

