/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      // Aqui é onde seu projeto escala. 
      // Você pode criar suas próprias cores: 'brand-blue': '#0055ff'
    },
  },
  plugins: [],
}