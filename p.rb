require "RMagick"

if !ARGV[0]
    puts "Usage: photo.rb path-to-image"
    exit
end

image = Magick::Image.read(ARGV[0]).first

width = image.columns
height = image.rows

bh = height * 0.10
bw = width * 0.10

if width > height
  bw = 0
else
  bh = 0
end

image.border!(bw, bh, "#000000")

out = ARGV[0].sub(/\./, "-b.")
puts "Writing #{out}"
image.write(out)
