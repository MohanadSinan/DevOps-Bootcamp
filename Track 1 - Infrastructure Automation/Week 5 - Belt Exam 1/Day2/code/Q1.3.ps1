# Reading the user input
$Num = Read-Host "Input a number"

# If statement to compare the user input value with the number 10
if ( [int]$Num -gt 10 ) {
    Write-Host "Number is bigger than 10."
}
elseif ( [int]$Num -eq 10 ) {
    Write-Host "Number is equal to 10."
}
elseif ( [int]$Num -lt 10 ) {
    Write-Host "Number is less than  10."
}
else {
    Write-Host "Error"
}