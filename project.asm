;Project Title: PAY SLIP MANAGEMENT SYSTEM
;Author: MUHAMMAD SAAD
;Registration Number: 2018-CS-7
;Author: Daniyal Iqbal
;Registration Number: 2018-CS-20


Include Irvine32.inc

.data

titleOfProject BYTE "			************************ PAY SLIP MANAGEMENT SYSTEM ************************", 0
menu BYTE "Select from the following menu.", 0dh, 0ah			; menu template
	 BYTE " ",  0dh, 0ah
     BYTE "1. Enter today's data", 0dh, 0ah
     BYTE "2. Apply for leave", 0dh, 0ah
     BYTE "3. Show the report", 0dh, 0ah
     BYTE "4. Exit", 0dh, 0ah, 0

selection BYTE "Enter the number of your selection: ", 0		;input prompt

nameEnter BYTE "Enter your name: ", 0							;input prompt
dayEnter BYTE "Enter the day: ", 0								;input prompt
hoursEnter BYTE "Enter number of hours you worked today: ", 0	;input prompt

leaveConfirmation BYTE "Enter 1 if you want to apply for leave and 0 to exit to main menu: ", 0		;leave confirmation prompt
confirmedLeave BYTE "Your leave has been added.", 0				;leave confirmed prompt
deniedLeave BYTE "Leave is not allowed.", 0						;leave denied prompt

nameHeading BYTE "Name        ", 0								;heading
dayHeading BYTE "Day        ", 0								;heading
hourHeading BYTE "Hours Worked		", 0						;heading

salaryPerHour DWORD 30											;salary per hour									
leaveCount BYTE 0												;Total leaves
counter DWORD 1													;counter to keep track of days while inputing
printCounter DWORD 0											;counter to keep track of days during printing on console
totalPay DWORD 0

day1 DWORD ?
day2 DWORD ?
day3 DWORD ?
day4 DWORD ?
day5 DWORD ?
nameOfEmployee BYTE 15 DUP (?)									;to store the name of employee
hoursEmployeeWorkedOnDay1 DWORD ?
hoursEmployeeWorkedOnDay2 DWORD ?
hoursEmployeeWorkedOnDay3 DWORD ?
hoursEmployeeWorkedOnDay4 DWORD ?
hoursEmployeeWorkedOnDay5 DWORD ?
space BYTE "        ", 0
error BYTE " ------------------------------ ", 0dh, 0ah			;error prompt
      BYTE "|Error: This is invalid option.|", 0dh, 0ah
      BYTE " ------------------------------ ", 0

hoursPrompt BYTE "Total Hours Worked: ", 0						;total hours prompt to display on screen
totalPayPrompt BYTE "Total Pay: ", 0							;total pay prompt to display on screen
equals BYTE " ------------------------------ ", 0dh, 0ah		;table to show number with corresponding day
      BYTE "| Enter 1: For Monday |", 0dh, 0ah
      BYTE "| Enter 2: For Tuesday |", 0dh, 0ah
      BYTE "| Enter 3: For Wednesday |", 0dh, 0ah
      BYTE "| Enter 4: For Thursday |", 0dh, 0ah
      BYTE "| Enter 5: For Friday |", 0dh, 0ah
      BYTE " ------------------------------ ", 0

.code

calSum proc														;procedure to calculate total hours worked in a week

	mov eax, hoursEmployeeWorkedOnDay1
	add eax, hoursEmployeeWorkedOnDay2
	add eax, hoursEmployeeWorkedOnDay3
	add eax, hoursEmployeeWorkedOnDay4
	add eax, hoursEmployeeWorkedOnDay5

	ret

calSum endp

print proto, day: dword, hourWorked: dword						;function to print data

main proc
		
     call crlf
	 mov edx, offset titleOfProject								;moving address of title of project into edx to print it
	 call writestring
	 call crlf
	 call crlf

	 start:
		
		   mov edx, offset menu			
		   call writestring										;printing the menu on console
		   call crlf
		   call crlf

		   mov edx, offset selection						
		   call writestring										;printing the selection prompt on console

		   call readint

		cmp eax, 1												;comparing selection result for jumping at particular label
		je L1
		cmp eax, 2												;comparing selection result for jumping at particular label
		je L2
		cmp eax, 3												;comparing selection result for jumping at particular label			
		je L3
		cmp eax, 4												;comparing selection result for jumping at particular label
		je _exit												;jumping to end of program if option 4 is selected

		jmp err													;handling exception



		L1:
		   call crlf
		   call crlf

			mov edx, offset nameEnter							
			call writestring									;displaying prompt of asking user for his/her name

			mov edx, offset nameOfEmployee
			mov ecx, sizeof nameOfEmployee
			call readstring										;taking name as a input from the user
			call crlf

			mov edx, offset equals
			call writestring									;displaying number day corresponding table
			call crlf
			call crlf

			mov edx, offset dayEnter
			call writestring									;displaying prompt of asking user for the day

			cmp counter, 1										;comparing entered day result for jumping at particular label
			je day_1
			cmp counter, 2										;comparing entered day result for jumping at particular label
			je day_2
			cmp counter, 3										;comparing entered day result for jumping at particular label
			je day_3
			cmp counter, 4										;comparing entered day result for jumping at particular label
			je day_4
			cmp counter, 5										;comparing entered day result for jumping at particular label
			je day_5

			day_1: 
				call readint									
				mov day1, eax									;storing received value in a variable
				call crlf
				jmp hours
			day_2:
				call readint
				mov day2, eax									;storing received value in a variable
				call crlf
				jmp hours

			day_3:
				call readint
				mov day3, eax									;storing received value in a variable
				call crlf
				jmp hours

			day_4:
				call readint
				mov day4, eax									;storing received value in a variable
				call crlf
				jmp hours

			day_5:
				call readint
				mov day5, eax									;storing received value in a variable
				call crlf
				jmp hours
				

		hours:
			mov edx, offset hoursEnter					
			call writestring	

			cmp counter, 1										;comparing counter for jumping at particular label
			je monday
			cmp counter, 2										;comparing counter for jumping at particular label
			je tuesday
			cmp counter, 3										;comparing counter for jumping at particular label
			je wednesday
			cmp counter, 4										;comparing counter for jumping at particular label
			je thursday
			cmp counter, 5										;comparing counter for jumping at particular label
			je friday
			
			monday: 
				call readint
				mov hoursEmployeeWorkedOnDay1, eax				;storing received value in a variable
				call crlf
				inc counter
				jmp start


			tuesday:
				call readint
				mov hoursEmployeeWorkedOnDay2, eax				;storing received value in a variable
				call crlf
				inc counter
				jmp start

			wednesday:

				call readint
				mov hoursEmployeeWorkedOnDay3, eax				;storing received value in a variable
				call crlf
				inc counter
				jmp start

			thursday:

				call readint
				mov hoursEmployeeWorkedOnDay4, eax				;storing received value in a variable
				call crlf
				inc counter
				jmp start

			friday:
				
				call readint
				mov hoursEmployeeWorkedOnDay5, eax				;storing received value in a variable
				call crlf	
				inc counter
				jmp start

		L2:
			call crlf
			mov edx, offset leaveConfirmation
			call writestring									;displaying prompt which will ask user to confirm leave
			call readint
			
			cmp eax, 0											;comparing entered value for jumping at particular label
			je start

			inc leaveCount
			cmp leaveCount, 1
			jg L4
			call crlf

			mov edx, offset nameEnter
			call writestring									;displaying prompt of asking user for his/her name

			mov edx, offset nameOfEmployee
			mov ecx, sizeof nameOfEmployee
			call readstring										;taking name as a input from the user
			call crlf

			mov edx, offset equals
			call writestring									;displaying number day corresponding table
			call crlf

			mov edx, offset dayEnter
			call writestring									;displaying prompt of asking user for the day

			cmp counter, 1										;comparing entered day result for jumping at particular label
			je days_1
			cmp counter, 2										;comparing entered day result for jumping at particular label
			je days_2
			cmp counter, 3										;comparing entered day result for jumping at particular label
			je days_3
			cmp counter, 4										;comparing entered day result for jumping at particular label
			je days_4
			cmp counter, 5										;comparing entered day result for jumping at particular label
			je days_5

			days_1: 
				call readint
				mov day1, eax									;storing received value in a variable
				call crlf
				jmp hour
			days_2:
				call readint
				mov day2, eax									;storing received value in a variable
				call crlf
				jmp hour

			days_3:
				call readint
				mov day3, eax									;storing received value in a variable
				call crlf
				jmp hour

			days_4:
				call readint
				mov day4, eax									;storing received value in a variable
				call crlf
				jmp hour

			days_5:
				call readint
				mov day5, eax									;storing received value in a variable
				call crlf
				jmp hour
				

		hour:

			cmp counter, 1										;comparing counter for jumping at particular label
			je mon
			cmp counter, 2										;comparing counter for jumping at particular label
			je tues
			cmp counter, 3										;comparing counter for jumping at particular label
			je wed
			cmp counter, 4										;comparing counter for jumping at particular label
			je thurs
			cmp counter, 5										;comparing counter for jumping at particular label
			je fri
			
			mon: 
				mov hoursEmployeeWorkedOnDay1, 8				;storing received value in a variable
				inc counter
				jmp leaveConfirm

			tues:
				mov hoursEmployeeWorkedOnDay2, 8				;storing received value in a variable
				inc counter
				jmp leaveConfirm

			wed:

				mov hoursEmployeeWorkedOnDay3, 8				;storing received value in a variable
				inc counter
				jmp leaveConfirm

			thurs:

				mov hoursEmployeeWorkedOnDay4, 8				;storing received value in a variable
				inc counter
				jmp leaveConfirm

			fri:
				
				mov hoursEmployeeWorkedOnDay5, 8				;storing received value in a variable
				inc counter
				jmp leaveConfirm

		leaveConfirm:

			mov edx, offset confirmedLeave
			call writestring									;displaying the prompt to tell user that leave has been confirmed
			call crlf
			call crlf

			jmp start

		L3:
			call crlf
			mov edx, offset space
			call writestring									
			mov edx, offset nameHeading
			call writestring									;displaying name heading
			mov edx, offset dayHeading
			call writestring									;displaying day heading
			mov edx, offset hourHeading
			call writestring									;displaying hour heading
			call crlf

			INVOKE print, day1, hoursEmployeeWorkedOnDay1		;procedure to display on console
			call crlf
			INVOKE print, day2, hoursEmployeeWorkedOnDay2		;procedure to display on console
			call crlf
			INVOKE print, day3, hoursEmployeeWorkedOnDay3		;procedure to display on console
			call crlf
			INVOKE print, day4, hoursEmployeeWorkedOnDay4		;procedure to display on console
			call crlf
			INVOKE print, day5, hoursEmployeeWorkedOnDay5		;procedure to display on console
			call crlf


			call crlf
			call crlf
			mov edx, offset hoursPrompt	
			call writeString
			call calSum											;calculating sum of hours
			call writeint
			call crlf
			call crlf

			mov edx, offset totalPayPrompt
			call writestring
			mul salaryPerHour									;calculating total salary
			call writeint
			call crlf
			call crlf

			jmp start

		L4:
			call crlf
			mov edx, offset deniedLeave	
			call writestring									;prompt to display when the leave is denied
			call crlf
			call crlf

	        jmp start

	err:
	    call crlf
	    mov edx, offset error
		call writestring										;error handling

		call crlf
		call crlf

		jmp start

	_exit:

main endp

print proc uses edx, day: dword, hourWorked: dword				;procedure to display user date on console
	
	mov edx, offset space
	call writestring

	mov edx, offset nameOfEmployee
	call writestring

	mov edx, offset space
	call writestring

	mov eax, day
	call writeint

	mov edx, offset space
	call writestring

	mov eax,  hourWorked
	call writeint

	ret

print endp
end main