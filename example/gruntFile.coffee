module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    connect:
      host:
        options:
          port: 30000
          hostname: 'localhost'
          base:'host'
      guest:
        options:
          port: 30001
          hostname: 'localhost'
          base:'guest'
    open:
      server:
        url:'http://localhost:30000'

    watch:
      options:
        livereload: 30003
      clientFile:
        files: ['**/*.html']
        tasks: []

  grunt.registerTask "default", [
    'connect'
    'open'
    'watch'
  ]