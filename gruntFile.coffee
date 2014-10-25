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

    blanket_mocha:
      test:
        src: ['test/**/*.html']
        options:
          threshold: 90
          run: false

  grunt.registerTask "build", [
    'clean'
    'coffee'
    'uglify'
  ]

  grunt.registerTask "test", [
    'blanket_mocha'
  ]

  grunt.registerTask "default", [
    'build'
    'test'
  ]