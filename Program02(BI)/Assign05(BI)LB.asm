; Author: Lazaro Beas
; Date: 04/08/2024
; Program Description: Calculates the final percentage grade for a student based on exam scores

.386
.model flat, stdcall
.stack 4096

.data
    pointsEarned  dd  25, 89, 49, 80      ; Creating array of points earned
    pointsPossible  dd  30, 100, 50, 150  ; Creating array of points possible for each exam
    percent dd ?                          ; Variable to store the percentage 

.code
_main PROC

    ; Initialize registers
    xor eax, eax    ; Clear EAX 
    xor ebx, ebx    ; Clear EBX 
    xor ecx, ecx    ; Clear ECX 

    ; Calculate sumEarned
    mov eax, [pointsEarned + ecx * 4]       ; Move pointsEarned[0] to EAX
    add eax, [pointsEarned + ecx * 4 + 4]   ; Adding the next index with weights to EAX
    add eax, [pointsEarned + ecx * 4 + 8]   ; Add the next index to EAX 
    add eax, [pointsEarned + ecx * 4 + 12]  ; Add the final index to EAX

    ; Calculate sumPossible
    mov ebx, [pointsPossible + ecx * 4]       ; Move first index to EBX
    add ebx, [pointsPossible + ecx * 4 + 4]   ; Add next index to EBX
    add ebx, [pointsPossible + ecx * 4 + 8]   ; Add next index to EBX
    add ebx, [pointsPossible + ecx * 4 + 12]  ; Add final index with weights to EBX

    ; Calculate percentage
    mov ecx, 100    ; Move 100 to ECX
    mul ecx         ; Multiply EAX by 100
    div ebx         ; Divide EAX by EBX

    ; Store the answer in the percent variable
    mov percent, eax

    ; Deinit/exit
    mov eax, 0
    ret

_main ENDP



END _main