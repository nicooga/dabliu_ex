exports.config =
  files:
    javascripts:
      joinTo:
        'admin/js/app.js': /(web\/static\/admin\/js)/,
        'front/js/app.js': /(web\/static\/front\/js)/,
        'js/vendor.js':    /(bower_components|(\/usr\/lib\/)?node_modules)/
    stylesheets:
      joinTo:
        'admin/css/app.css': /(web\/static\/admin\/css)/,
        'front/css/app.css': /(web\/static\/front\/css)/,
        'css/vendor.css':    /(bower_components|(\/usr\/lib\/)?node_modules)/
      order:
        after: ['web/static/front/css/app.css'] # concat app.css last

  conventions:
    assets: /^(web\/static\/(front|admin)\/assets)/

  paths:
    watched: [
      'web/static',
      'test/static'
    ],

    public: 'priv/static'

  modules:
    autoRequire:
      'front/js/app.js': ['web/static/front/js/app'],
      'admin/js/app.js': ['web/static/admin/js/app'],

  npm:
    enabled: true,
    styles:
      'bootstrap':    ['dist/css/bootstrap.min.css'],
      'font-awesome': ['css/font-awesome.min.css']
