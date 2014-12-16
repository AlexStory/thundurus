var gulp = require("gulp"),
  sass = require("gulp-sass"),
  coffee = require("gulp-coffee"),
  webserver = require("gulp-webserver");

gulp.task("sass", function() {
  gulp.src("./css/main.scss")
  .pipe(sass())
  .on("error", console.log)
  .pipe(gulp.dest("./css/"));
});

gulp.task("coffee", function() {
  gulp.src("./js/*.coffee")
  .pipe(coffee())
  .on("error", console.log)
  .pipe(gulp.dest("./js/"));
});

gulp.task("default", [ "sass", "coffee" ], function() {
  gulp.src("./")
    .pipe(webserver());
    gulp.watch("css/*.scss", [ "sass" ] )
    gulp.watch("js/*.coffee", [ "coffee" ] )
});
