$LOAD_PATH << '.'

class Admin  
  
	def admin_panel
		@@classlibmanagement = LibManagement1.new
		puts "welcome to admin panel"
		3.times {
		  puts "enter your password"

			password_admin = gets.chomp
      if (password_admin == "12345")
        after_successful_login(@@classlibmanagement)#while condition for admin panel
		  else
		  	count = 3
		    puts "wrong password re-login"
        count = count -1
        if count == 0
        	puts "wrong password re-login , your attempt finish"
        end 
      end #inner if close for password checking
    }	
  end
  def after_successful_login(classlibmanagement)
		while (true)
     	puts "welcome admin"
     	puts "press 1  for book manipulation "
     	puts "press 2  for student list      "
     	puts "press 3  for add student in lib"
     	input_admin_value=gets.chomp
     	case input_admin_value
     	when "1"
     		condition2=true
     		while (true)
     			puts "=====  to add a book press a  ====="
		      puts "=====  to delete a book press b  ====="
		      puts "=====  to return a book press c  ====="
		      puts "=====  to issue a book press d  ====="
		      input_book_manvalue=gets.chomp
		      case input_book_manvalue
		      when "a"
		      	add_book_option =true
		      	while (true)
			      	puts "adding a book"
			      	puts "enter book id"
			      	book_id=gets.chomp.to_i
			      	puts "enter book name"
			      	book_name =gets.chomp
			      	check = $book_name.include? book_name
			        if (check ==true)
			        	puts " book_name and book_id is already available please insert book book_quantity "
			        	puts " which you want to add"
			        	puts " enter book book_quantity "
			      	  book_quantity =gets.chomp.to_i
			      	  value1 = $book_name.index("#{book_name}")
			      	  #puts value1
			      	  $book_quantity[value1] = $book_quantity[value1].to_i+book_quantity

			      	  puts "available book in Libmanagementsysytem"
				      	classlibmanagement.user_table_book
			      	else  
			        	puts "enter book book_quantity"
			      	  book_quantity =gets.chomp.to_i
			      	  $book_id << book_id
				      	$book_name << book_name
				      	$book_quantity << book_quantity
				      	puts "available book in Libmanagementsysytem"
				      	classlibmanagement.user_table_book
				      	
			        end
			        puts "do you want to add more book press yes otherwise no"
				      	add_book=gets.chomp
				      	  if(add_book =="no")
				      		  add_book_option =false
				      		  break
				      	  end
            end
		      when "b"
		      	puts "deleting a book"
		      	user_table = table do |t|
		        	t.headings = 'book_id','book_name','book_quantity'
		        	t << $book_id
		        	t << $book_name
		        	t << $book_quantity
            end
            puts user_table
		      	puts "enter a book_name which you want to delete "
		      	book_name = gets.chomp
		      	value = $book_name.index("#{book_name}")
		      	#puts "#{value}"
		      	$book_name.delete_at(value)
		      	$book_id.delete_at(value)
		      	$book_quantity.delete_at(value)
		      	puts "available book in Libmanagementsysytem"
		      	user_table = table do |t|
		        	t.headings = 'book_id','book_name','book_quantity'
		        	t << $book_id
		        	t << $book_name
		        	t << $book_quantity
            end
            puts user_table
		      	
		      when "c"
            classlibmanagement.return_book
          when "d"
		      	classlibmanagement.issue_book
		      else
		       puts "wrong input"			
          end
		      puts "=====  do you want to continue in admin book manipulating profile press 1 otherwise 2  ====== "
          exit_value = gets.chomp
						if (exit_value == "2")
							condition2 = false
							break
						end
        end #inner while loop for book manipulation

     	when "2"
     			classlibmanagement.student_table
     	when "3"
     		classlibmanagement.add_student
      else
     	  puts "wrong input retry"
     	end
     	puts "======  do you want to continue in admin profile press 1 otherwise 2  ====== "
			exit_value = gets.chomp
				if (exit_value == "2")
					 exit
        end #inner if for condition
    end #outer while loop end
	end #mehod end
	

end
