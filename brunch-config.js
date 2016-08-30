exports.config = {
  files: {
    javascripts: {
      joinTo: {
        'js/app.js':    /(web\/static\/js)/,
        'js/vendor.js': /(bower_components|(\/usr\/lib\/)?node_modules)/
      }
    },
    stylesheets: {
      joinTo: 'css/app.css',
      order: {
        after: ['web/static/css/app.css'] // concat app.css last
      }
    },
  },

  conventions: {
    assets: /^(web\/static\/assets)/
  },

  paths: {

    watched: [
      'web/static',
      'test/static'
    ],

    public: 'priv/static'
  },

  modules: {
    autoRequire: {
      'js/app.js': ['web/static/js/app']
    }
  },

  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    }
  },

  npm: {
    enabled: true,
    styles: {
      'bootstrap': ['dist/css/bootstrap.min.css'],
      'font-awesome': ['css/font-awesome.min.css']
    }
  }
};
