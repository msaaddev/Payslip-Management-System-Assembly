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

salaryPerHour DWORD 30
totalHoursPerWeek DWORD 40
leaveCount DWORD ?

days BYTE 5 DUP ("Wednesday")
nameOfEmployee BYTE 5 DUP ("John Wick")
hoursEmployeeWorked DWORD 5 DUP (?)

check byte "This is a check", 0

.code
main proc
	
	start: 
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
		
		L2:

		L3:


	jmp start

	_exit:
	
	mov edx, offset check
	call writestring

main endp
end main