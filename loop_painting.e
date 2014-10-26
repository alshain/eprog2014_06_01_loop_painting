note
	description : "Drawing figures with asterisks."

class
	LOOP_PAINTING

create
	make

feature -- Initialization

	make
			-- Get size and paint.
		local
			n: INTEGER
		do
			Io.put_string ("Enter a positive integer: ")
			Io.read_integer
			n := io.last_integer

			if n <= 0 then
				print ("Wrong input")
			else
				print ("%NCheckered triangle:%N%N")
				print_checker_triangle (n)

				print ("%N%N")

				print ("Checkered diamond:%N%N")
				print_checker_diamond (n)
			end
		end

feature -- Painting

	print_checker_triangle (n: INTEGER)
			-- Print a checker triangle of size `n'.
		require
			positive_n: n > 0
		local
			i, j, space: INTEGER
		do
			from
				i := 1
				space := 0
			until
				i > n
			loop
				from
				 	j := 1
				until
					j > i
				loop
					if j \\ 2 = space then
						print (' ')
					else
					 	print ('*')
					end
					j := j + 1
				end
				space := 1 - space
				i := i + 1
				print ("%N")
			end
		end

	print_checker_diamond (n: INTEGER)
			-- Print checker diamond of size `n'.
		require
			positive_n: n > 0
		local
			i: INTEGER
			left, middle: STRING
		do
			create left.make_filled (' ', n)
			middle := ""
			from
				i := 1
			until
				i > n
			loop
				left.remove_tail (1)
				middle.append ("* ")
				print (left + middle + "%N")
				i := i + 1
			end
			from
				i := 1
			until
				i > n
			loop
				left.append (" ")
				middle.remove_tail (2)
				print (left + middle + "%N")
				i := i + 1
			end
		end
end
