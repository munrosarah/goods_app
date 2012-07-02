module ProductsHelper
  def create_image_list()
    image_index = 1
    option_array = Array.new
    option_array.push(['Select an image', 'Select'])
    image_index += 1
    Dir.foreach("app/assets/images/goods/") { |file|
      if file.length>2 then
        option_array.push([file, file])
        image_index += 1
      end
    }
    option_array.sort!
    
  end

end
