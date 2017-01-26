.PHONY: all

test: download-models test-stylization

download-models:
	wget -O models/multistyle-pastiche-generator-monet.ckpt http://download.magenta.tensorflow.org/models/multistyle-pastiche-generator-monet.ckpt && \
	wget -O models/multistyle-pastiche-generator-varied.ckpt http://download.magenta.tensorflow.org/models/multistyle-pastiche-generator-varied.ckpt

test-stylization:
	@image_stylization_transform \
		--num_styles=10 \
		--checkpoint=models/multistyle-pastiche-generator-monet.ckpt \
		--input_image=images/night_snow.jpg \
		--which_styles="{0:0.1,1:0.1,2:0.1,3:0.1,4:0.1,5:0.1,6:0.1,7:0.1,8:0.1,9:0.1}" \
		--output_dir=renders/image_stylization \
		--output_basename="all_monet_styles"
