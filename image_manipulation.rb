require "./image_array.rb"
puts " Give me an image that you want to transform!"
file_name = gets.chomp 
img = ImageArray.new("./" + file_name)
puts "What transformation would you like to use: random noise,tint,black and white or photo negative?"
answer = gets.chomp.to_s
if answer == "black and white"
	img.each do |row|
		row.each do |pixel|
			pixel_gray = (pixel.red + pixel.blue + pixel.green)/3
			pixel.red = pixel_gray
			pixel.green = pixel_gray
			pixel.blue = pixel_gray
		end
	end 
img.write("./file_name_bw.jpg")
elsif  answer == "tint"
	img.each do |row|
		row.each do |pixel|
			pixel.red = img.max_intensity
		end
	end 
img.write("./file_name_random_noise.jpg")
elsif  answer == "random noise"
	img.each do |row|
		row.each do |pixel|
			pixel.red = -rand(10000)+ pixel.red
			pixel.blue = -rand(10000)+ pixel.blue
			pixel.green = -rand(10000)+ pixel.green
		end
	end
img.write("./file_name_red_tint.jpg")
elsif answer == "photo negative"
	img.each do |row|
		row.each do |pixel|
			pixel.red = img.max_intensity - pixel.red
			pixel.blue = img.max_intensity - pixel.blue
			pixel.green = img.max_intensity - pixel.green
			end
	end
img.write("./file_name_photo_negative.jpg")
else
	puts" The effect you have put is not available or does not exist. Please try again."
end
