module.exports = function(config) {
    config.set({
      basePath:   '../..',
      autoWatch:  true,
      frameworks: ['jasmine'],

      preprocessors: {
        "**/*.coffee": "coffee"
      },

      files: [
        'vendor/assets/javascripts/angular.js',
        'vendor/assets/javascripts/angular-mocks.js',
        'app/assets/javascripts/angular/*.js.coffee',
        'app/assets/javascripts/angular/controllers/*.js.coffee',
        'spec/javascripts/**/*_spec.js.coffee'
      ]
    });
}
