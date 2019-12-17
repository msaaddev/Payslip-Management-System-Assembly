Include Irvine32.inc

.data

titleOfProject BYTE "			************************ PAY SLIP MANAGEMENT SYSTEM ************************", 0
menu BYTE "Select from the following menu.", 0dh, 0ah
	 BYTE " ",  0dh, 0ah
     BYTE "1. Enter today's data", 0dh, 0ah
     BYTE "2. Apply for leave", 0dh, 0ah
     BYTE "3. Show the report", 0dh, 0ah
     BYTE "4. Exit", 0dh, 0ah, 0

selection BYTE "Enter the number of your selection: ", 0

nameEnter BYTE "Enter your name: ", 0
dayEnter BYTE "Enter the day: ", 0
hoursEnter BYTE "Enter number of hours you worked today: ", 0

leaveConfirmation BYTE "Enter 1 if you want to apply for leave and 0 to exit to main menu: ", 0
confirmedLeave BYTE "Your leave has been added.", 0
deniedLeave BYTE "Leave is not allowed.", 0

nameHeading BYTE "Name        ", 0
dayHeading BYTE "Day        ", 0
hourHeading BYTE "Hours Worked		", 0

salaryPerHour DWORD 30
totalHoursPerWeek DWORD 40
leaveCount BYTE 0
counter dword 1
printCounter dword 0
totalPay dword 0

day1 DWORD ?
day2 DWORD ?
day3 DWORD ?
day4 DWORD ?
day5 DWORD ?
nameOfEmployee BYTE 15 DUP (?)
hoursEmployeeWorkedOnDay1 DWORD ?
hoursEmployeeWorkedOnDay2 DWORD ?
hoursEmployeeWorkedOnDay3 DWORD ?
hoursEmployeeWorkedOnDay4 DWORD ?
hoursEmployeeWorkedOnDay5 DWORD ?
space BYTE "        ", 0
error BYTE " ------------------------------ ", 0dh, 0ah
      BYTE "|Error: This is invalid option.|", 0dh, 0ah
      BYTE " ------------------------------ ", 0

hoursPrompt BYTE "Total Hours Worked: ", 0
totalPayPrompt BYTE "Total Pay: ", 0
equals BYTE " ------------------------------ ", 0dh, 0ah
      BYTE "| Enter 1: For Monday |", 0dh, 0ah
      BYTE "| Enter 2: For Tuesday |", 0dh, 0ah
      BYTE "| Enter 3: For Wednesday |", 0dh, 0ah
      BYTE "| Enter 4: For Thursday |", 0dh, 0ah
      BYTE "| Enter 5: For Friday |", 0dh, 0ah
      BYTE " ------------------------------ ", 0
check byte "This is a check", 0

.code

calSum proc 

	mov eax, hoursEmployeeWorkedOnDay1
	add eax, hoursEmployeeWorkedOnDay2
	add eax, hoursEmployeeWorkedOnDay3
	add eax, hoursEmployeeWorkedOnDay4
	add eax, hoursEmployeeWorkedOnDay5

	ret

calSum endp

print proto, day: dword, hourWorked: dword

main proc
		
     call crlf
	 mov edx, offset titleOfProject
	 call writestring
	 call crlf
	 call crlf

	 start:
		
		   mov edx, offset menu
		   call writestring
		   call crlf
		   call crlf

		   mov edx, offset selection
		   call writestring

		   call readint

		cmp eax, 1
		je L1
		cmp eax, 2
		je L2
		cmp eax, 3
		je L3
		cmp eax, 4
		je _exit

		jmp err


		L1:
		   call crlf
		   call crlf

			mov edx, offset nameEnter
			call writestring

			mov edx, offset nameOfEmployee
			mov ecx, sizeof nameOfEmployee
			call readstring	
			call crlf

			mov edx, offset equals
			call writestring
			call crlf
			call crlf

			mov edx, offset dayEnter
			call writestring

			cmp counter, 1
			je day_1
			cmp counter, 2
			je day_2
			cmp counter, 3
			je day_3
			cmp counter, 4
			je day_4
			cmp counter, 5
			je day_5

			day_1: 
				call readint
				mov day1, eax
				call crlf
				jmp hours
			day_2:
				call readint
				mov day2, eax
				call crlf
				jmp hours

			day_3:
				call readint
				mov day3, eax
				call crlf
				jmp hours

			day_4:
				call readint
				mov day4, eax
				call crlf
				jmp hours

			day_5:
				call readint
				mov day5, eax
				call crlf
				jmp hours
				

		hours:
			mov edx, offset hoursEnter
			call writestring

			cmp counter, 1
			je monday
			cmp counter, 2
			je tuesday
			cmp counter, 3
			je wednesday
			cmp counter, 4
			je thursday
			cmp counter, 5
			je friday
			
			monday: 
				call readint
				mov hoursEmployeeWorkedOnDay1, eax
				call crlf
				inc counter
				jmp start


			tuesday:
				call readint
				mov hoursEmployeeWorkedOnDay2, eax
				call crlf
				inc counter
				jmp start

			wednesday:

				call readint
				mov hoursEmployeeWorkedOnDay3, eax
				call crlf
				inc counter
				jmp start

			thursday:

				call readint
				mov hoursEmployeeWorkedOnDay4, eax
				call crlf
				inc counter
				jmp start

			friday:
				
				call readint
				mov hoursEmployeeWorkedOnDay5, eax
				call crlf
				inc counter
				jmp start

		L2:
			call crlf
			mov edx, offset leaveConfirmation
			call writestring
			call readint
			
			cmp eax, 0
			je start

			inc leaveCount
			cmp leaveCount, 1
			jg L4
			call crlf

			mov edx, offset nameEnter
			call writestring

			mov edx, offset nameOfEmployee
			mov ecx, sizeof nameOfEmployee
			call readstring	
			call crlf

			mov edx, offset equals
			call writestring
			call crlf

			mov edx, offset dayEnter
			call writestring

			cmp counter, 1
			je days_1
			cmp counter, 2
			je days_2
			cmp counter, 3
			je days_3
			cmp counter, 4
			je days_4
			cmp counter, 5
			je days_5

			days_1: 
				call readint
				mov day1, eax
				call crlf
				jmp hour
			days_2:
				call readint
				mov day2, eax
				call crlf
				jmp hour

			days_3:
				call readint
				mov day3, eax
				call crlf
				jmp hour

			days_4:
				call readint
				mov day4, eax
				call crlf
				jmp hour

			days_5:
				call readint
				mov day5, eax
				call crlf
				jmp hour
				

		hour:

			cmp counter, 1
			je mon
			cmp counter, 2
			je tues
			cmp counter, 3
			je wed
			cmp counter, 4
			je thurs
			cmp counter, 5
			je fri
			
			mon: 
				mov hoursEmployeeWorkedOnDay1, 8
				inc counter
				jmp leaveConfirm

			tues:
				mov hoursEmployeeWorkedOnDay2, 8
				inc counter
				jmp leaveConfirm

			wed:

				mov hoursEmployeeWorkedOnDay3, 8
				inc counter
				jmp leaveConfirm

			thurs:

				mov hoursEmployeeWorkedOnDay4, 8
				inc counter
				jmp leaveConfirm

			fri:
				
				mov hoursEmployeeWorkedOnDay5, 8
				inc counter
				jmp leaveConfirm

		leaveConfirm:

			mov edx, offset confirmedLeave
			call writestring
			call crlf
			call crlf

			jmp start

		L3:
			call crlf
			mov edx, offset space
			call writestring
			mov edx, offset nameHeading
			call writestring
			mov edx, offset dayHeading
			call writestring
			mov edx, offset hourHeading
			call writestring
			call crlf

			INVOKE print, day1, hoursEmployeeWorkedOnDay1
			call crlf
			INVOKE print, day2, hoursEmployeeWorkedOnDay2
			call crlf
			INVOKE print, day3, hoursEmployeeWorkedOnDay3
			call crlf
			INVOKE print, day4, hoursEmployeeWorkedOnDay4
			call crlf
			INVOKE print, day5, hoursEmployeeWorkedOnDay5
			call crlf


			call crlf
			call crlf
			mov edx, offset hoursPrompt	
			call writeString
			call calSum					;calculating sum of hours
			call writeint
			call crlf
			call crlf

			mov edx, offset totalPayPrompt
			call writestring
			mul salaryPerHour			;calculating total salary
			call writeint
			call crlf
			call crlf

			jmp start

		L4:
			call crlf
			mov edx, offset deniedLeave
			call writestring
			call crlf
			call crlf

	        jmp start

	err:
	    call crlf
	    mov edx, offset error
		call writestring

		call crlf
		call crlf

		jmp start

	_exit:

main endp

print proc uses edx, day: dword, hourWorked: dword
	
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