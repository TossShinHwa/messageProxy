module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    coffee:
      options:
        bare: true
      client:
        files: [
          expand: true
          cwd: 'lib/'
          src: '**/*.coffee'
          dest: 'assets/'
          ext: '.js'
        ]

    uglify:
      production:
        files:
          'assets/messageProxy.min.js': ["assets/messageProxy.js"]

    clean:
      all:
        src: "asset/**/*"


  grunt.registerTask "build", [
    'clean'
    'coffee'
    'uglify'
  ]

  grunt.registerTask "test", [

  ]

  grunt.registerTask "default", [
    'build'
  ]