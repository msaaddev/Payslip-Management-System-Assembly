Include Irvine32.inc

.data

titleOfProject BYTE "			************************ PAY SLIP MANAGEMENT SYSTEM ************************", 0
menu BYTE "Select from the following menu.", 0
option1 BYTE "1. Enter today's data", 0
option2 BYTE "2. Apply for leave", 0
option3 BYTE "3. Show the report", 0
option4 BYTE "4. Exit", 0
selection BYTE "Enter the number of your selection: ", 0
selectedOption DWORD ?

nameEnter BYTE "Enter your name: ", 0
dayEnter BYTE "Enter the day: ", 0
hoursEnter BYTE "Enter number of hours you worked today: ", 0

leaveConfirmation BYTE "Enter 1 if you want to apply for leave and 0 to exit to main menu: ", 0
confirmedLeave BYTE "Your leave has been added.", 0
deniedLeave BYTE "Leave is not allowed.", 0
space BYTE "			", 0
smallSpace BYTE "		", 0

nameHeading BYTE "	Name			", 0
dayHeading BYTE "Day			", 0
hourHeading BYTE "Hours Worked			", 0
payHeading BYTE "Total Pay", 0

salaryPerHour DWORD 30
totalHoursPerWeek DWORD 40
leaveCount BYTE 0
counter dword 0
printCounter dword 0
totalPay dword 0

days BYTE 5 DUP (?)
nameOfEmployee BYTE 15 DUP (?)
hoursEmployeeWorked BYTE 5 DUP (?)
blank BYTE "         ", 0
space BYTE "             ", 0
check byte "This is a check", 0

.code
main proc
	
	start: 
		
		call crlf
		mov edx, offset titleOfProject
		call writestring
		call crlf
		call crlf

		mov edx, offset menu
		call writestring
		call crlf
		call crlf
		mov edx, offset option1
		call writestring
		call crlf
		mov edx, offset option2
		call writestring
		call crlf
		mov edx, offset option3
		call writestring
		call crlf
		mov edx, offset option4
		call writestring
		call crlf
		call crlf
		mov edx, offset selection
		call writestring
		call readint
		mov selectedOption, eax
		call crlf
		call crlf

		cmp selectedOption, 1
		je L1
		cmp selectedOption, 2
		je L2
		cmp selectedOption, 3
		je L3
		cmp selectedOption, 4
		je _exit


		L1:
			mov edx, offset nameEnter
			call writestring

			mov edx, offset nameOfEmployee
			mov ecx, sizeof nameOfEmployee
			call crlf
			call dumpregs

			mov edx, offset dayEnter
			call writestring

			mov edx, offset days
			mov ecx, sizeof days

			call readstring	
			call crlf
			call dumpregs

			mov edx, offset hoursEnter
			call writestring

			mov edx, offset hoursEmployeeWorked
			mov ecx, sizeof hoursEmployeeWorked 
			call readstring
			call crlf

			call dumpregs
			inc counter
			call crlf

			jmp start

		L2:
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

			mov esi, offset nameOfEmployee
			add esi, counter 
			mov edx, esi
			mov ecx, 12
			call readstring	
			call crlf

			mov edx, offset dayEnter
			call writestring

			mov esi, offset days
			add esi, counter 
			mov edx, esi
			mov ecx, 12
			call readstring	
			call crlf

			mov esi, offset hoursEmployeeWorked
			add esi, counter 
			mov esi, 8

			mov edx, offset confirmedLeave
			call writestring
			call crlf
			call crlf

			jmp start
		L3:
			
			mov edx, offset nameHeading
			call writestring
			mov edx, offset dayHeading
			call writestring
			mov edx, offset hourHeading
			call writestring
			mov edx, offset payHeading
			call writestring
			call crlf

			mov edx, offset blank
			call writestring

			mov edx, offset nameOfEmployee
			call writestring

			mov edx, offset space
			call writestring

			mov edx, offset days
			call writestring

			mov edx, offset space
			call writestring

			mov edx, offset hoursEmployeeWorked
			call writestring

			;mov ebx, offset hoursEmployeeWorked
			;mov eax, [ebx]
			;call writeint

				mov edx, offset space
				call writestring

				mov edx, offset days
				add edx, printCounter
				call writestring

				inc printCounter
				call crlf
				call dumpregs

			LOOP printBody
		jmp start

		L4:
			call crlf
			mov edx, offset deniedLeave
			call writestring

	jmp start

	_exit:
	
	mov edx, offset check
	call writestring

main endp
end main