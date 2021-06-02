module.exports = {
  mode: 'jit',
  purge: [
      './views/templates/**/*.tpl'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
      container: {
        padding: {
            DEFAULT: '1rem',
            sm: '2rem',
            lg: '4rem',
            xl: '8rem',
            '2xl': '12rem'
        },
          center: true,
        screens: {
          'print': { 'raw': 'print' },
          // => @media print { ... }
        }
      }
  },
  variants: {
    extend: {},
  },
  plugins: [
      require('@tailwindcss/forms'),
      require('@tailwindcss/typography')
  ],
}
