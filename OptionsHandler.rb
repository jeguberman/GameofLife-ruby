class OptionsHandler

	def self.process_args(args)
		$options = { dim: 25, speed: 15, 


		args.each do |arg|
			if ["help", "-help", "--help"].include? arg do
				print_help		
				break
			end
			if arg.start_with? "-d" or arg.start_with? "--dim"
				options[:dim] = get_arg(arg)
				next
			end
			if arg.start_with? "-s" or arg.start_with? "--speed"
				options[:speed] = get_arg(arg)
				next
			end
			if arg.start_with? "-r" or arg.start_with? "--rounds"
				options[:rounds] = get_arg(arg)
			end
		end
	end

	def print_help
		"This is game of life by John Conway, you probably know what this is.\r\n
		\r\n
		Set board size with -d or --dim, like this.\r\n
		$: ruby GoL.rb -d=80\r\n
		\r\n
		Set game speed to wait, low, medium, high or max with -s or --speed\r\n
		$: ruby GoL.rb -s=low\r\n
		When game is set to wait, it won't advance the game frame until you push any key, except for q, which will stop the program\r\n
		\r\n
		Set the number of frames to calculate before quitting. You can always interupt with ctrl+c... probably\r\n
		$: ruby GoL.rb -r=15\r\n
		\r\n
		So to set a fast game with a 42x42 unit gameboard to run for 18 turns you would use\r\n
		$: ruby GoL.rb -s=fast -d=42 -r=18\r\n"
	end

	def get_arg(arg)
		split_arg = arg.split("=")
		if split_arg.length != 2
			throw new Exception "invalid argument, try \"./GoL.rb help\" to see an example of a valid argument"
		else
			return split_arg[1]
		end
	end

end
