note
	description : "Loop_painting application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	LOOP_PAINTING

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	dimension: INTEGER

	make
			-- Run application.
		do
			--Ask for integer between 0 and 40
			Io.put_string ("Enter the dimension: ")
			Io.read_integer
			from

			until
				Io.last_integer >= 0 and Io.last_integer < 40
			loop
				if Io.last_integer < 0 then
					Io.put_string ("Dimension must be positive, enter new dimension: ")
				else
					Io.put_string ("Dimension needs to be under 40 for right execution, enter new dimension: ")
				end
				Io.read_integer
			end
			dimension:= Io.last_integer
			print_triangle
			print_diamond
		end


	print_triangle
		--prints checker triangle acording to dimension
		local
			zeile, spalte: INTEGER
		do
			Io.put_string ("%NChecker triangle:%N%N")
			from
				zeile:= 0
			until
				zeile = dimension
			loop
				zeile:= zeile + 1
				from
					spalte:= 0
				until
					spalte = zeile
				loop
					spalte:= spalte + 1
					if zeile\\2 = 0 and spalte\\2 = 1 then
						Io.put_string (" ")
					elseif zeile\\2 = 0 and spalte\\2 = 0 then
						Io.put_string ("*")
					elseif zeile\\2 = 1 and spalte\\2 = 1 then
						Io.put_string ("*")
					else
						Io.put_string (" ")
					end
				end
				Io.put_string ("%N")
			end
		end

	print_diamond
	--prints checker diamond acording to dimension
		local
			zeile, spalte: INTEGER
		do
			Io.put_string ("%N%NChecker diamond:%N%N")
			from
				zeile:= 0
			until
				zeile = 2*dimension - 1
			loop
				zeile:= zeile + 1
				if (zeile <= dimension) then
					from
						spalte:= 0
					until
						spalte = dimension - zeile
					loop
						spalte:= spalte + 1
						Io.put_string (" ")
					end

					from
						spalte:= dimension - zeile
					until
						spalte = dimension
					loop
						spalte:= spalte + 1
						Io.put_string ("* ")
					end
				else
					from
						spalte:= 0
					until
						spalte = zeile - dimension
					loop
						spalte:= spalte + 1
						Io.put_string (" ")
					end

					from
						spalte:= zeile - dimension
					until
						spalte = dimension
					loop
						spalte:= spalte + 1
						Io.put_string ("* ")
					end
				end
				Io.put_string ("%N")
			end
		end

invariant
input_bigger_0: dimension >= 0
end
