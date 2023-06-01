.data
    result: .asciiz "The bigger number is: "

.text
    main:
        # Assign values to $t0 and $t1
        li $t0, 8	# Assign value 1
        li $t1, 15	# Assign value 2
        
        # Calculate sum and subtraction
        add $t2, $t0, $t1    # Sum
        sub $t3, $t0, $t1    # Subtraction

        # Compare and determine the bigger number
        slt $t5, $t2, $t3 # Will compare if $t2 is smaller than $t3, and return 1 if is true, and 0 if its not

    print_result:
        # Print the result
        li $v0, 4
        la $a0, result
        syscall

        # Print the value of the bigger number
        li $v0, 1
        move $a0, $t4
        syscall

        # Exit the program
        li $v0, 10
        syscall
