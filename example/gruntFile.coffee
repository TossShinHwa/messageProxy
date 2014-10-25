module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    connect:
      public:
        options:
          port: 30000
          hostname: 'localhost'
          base:''

    open:
      server:
        url:'http://localhost:30000/host.html'

    watch:
      options:
        livereload: 30003
      clientFile:
        files: ['**/*']
        tasks: []

  grunt.registerTask "default", [
    'connect'
    'open'
    'watch'
  ]