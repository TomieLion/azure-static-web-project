/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export', // This is the magic line for static hosting
  images: { unoptimized: true } // Required for static export
}
module.exports = nextConfig