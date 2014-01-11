module.exports = function(config) {
    config.set({
      basePath:   '../..',
      autoWatch:  true,

      preprocessors: {
        "**/*.coffee": "coffee"
      },

      files: [
        'vendor/assets/javascripts/angular.js',
        'vendor/assets/javascripts/angular-mocks.js',
        'app/assets/javascripts/angular/*',
        'spec/javascripts/**/*_spec.js.coffee'
      ]
    });
}
