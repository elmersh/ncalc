let mix = require('laravel-mix');
require('laravel-mix-tailwind');


mix.js('src/js/app.js', 'js')
   .sass('src/scss/app.scss', 'css')
   .setPublicPath('dist')
    .options({
        processCssUrls: false
    })
    .tailwind()
    .version()
    .browserSync({
      proxy: "http://ncalc.esh",
        files: [
            "views/templates/**/*.tpl",
            "./**/*.php"
        ]
    }); // Hot reloading

if (mix.inProduction()) {
    mix.version();
}