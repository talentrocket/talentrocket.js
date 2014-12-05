gulp     = require 'gulp'
gutil    = require 'gulp-util'
coffee   = require 'gulp-coffee'
istanbul = require 'gulp-istanbul'
mocha    = require 'gulp-mocha'
concat   = require 'gulp-concat'

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe concat('talentrocket.coffee')
    .pipe coffee().on('error', gutil.log)
    .pipe gulp.dest './lib/'

gulp.task 'test', ['coffee'], ->
  gulp.src ['lib/**/*.js']
    .pipe(istanbul())
    .on 'finish', ->
      gulp.src(['test/**/*.spec.coffee'])
        .pipe mocha reporter: 'spec', compilers: 'coffee:coffee-script'
        .pipe istanbul.writeReports() # Creating the reports after tests run

gulp.task 'default', ['coffee']
