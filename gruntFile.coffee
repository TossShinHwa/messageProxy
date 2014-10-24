module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    coffee:
      options:
        bare: true
      main:
        files: [
          expand: true
          cwd: 'lib/'
          src: '**/*.coffee'
          dest: 'assets/'
          ext: '.js'
        ]
      test:
        files: [
          expand: true
          cwd: 'test/'
          src: '**/*.coffee'
          dest: 'test/'
          ext: '.js'
        ]

    uglify:
      production:
        files:
          'assets/messageProxy.min.js': ["assets/messageProxy.js"]

    clean:
      all:
        src: "asset/**/*"

    mocha:
      test:
        src: ['test/**/*.html']
        options:
          run: true

  grunt.registerTask "build", [
    'clean'
    'coffee'
    'uglify'
  ]

  grunt.registerTask "test", [
    'mocha'
  ]

  grunt.registerTask "default", [
    'build'
    'test'
  ]