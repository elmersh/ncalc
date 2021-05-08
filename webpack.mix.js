let mix = require('laravel-mix');
require('laravel-mix-tailwind');

mix.setPublicPath('dist/assets');
mix.js('src/js/app.js', 'dist/assets')
    .sass('src/scss/app.scss', 'dist/assets')
    .options({
        processCssUrls: false
    })
    .tailwind();

if (mix.inProduction()) {
    mix.version();
}