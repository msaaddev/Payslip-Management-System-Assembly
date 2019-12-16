Include Irvine32.inc

.data

titleOfProject BYTE "			************************ PAY SLIP MANAGEMENT SYSTEM ************************", 0
salaryPerHour DWORD 30

menu BYTE "Select from the following menu.", 0
option1 BYTE "1. Enter today's data", 0
option2 BYTE "2. Apply for leave", 0
option3 BYTE "3. Show the report", 0
selection BYTE "Enter the number of your selection: ", 0
selectedOption DWORD ?


.code
main proc
	
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
	call crlf
	mov edx, offset selection
	call writestring
	call readint
	mov selectedOption, eax

	
main endp
end main