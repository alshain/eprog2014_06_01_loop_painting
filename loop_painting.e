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
			s: STRING
			add_space: BOOLEAN
		do
			s := "*%N"
			add_space := True
			across 1 |..| n as x
			loop
				Io.put_string (s)
				if add_space then
					s := " " + s
				else
					s := "*" + s
				end

				add_space := not add_space
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
