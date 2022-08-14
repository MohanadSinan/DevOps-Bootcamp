# Assigning an array variable that contains four provinces of Saudi Arabia
$ProvincesArray = "Mecca", "Medina", "Jizan", "Riyadh"

# Printing a string "Provinces of Saudi Arabia:"
Write-Host "Provinces of Saudi Arabia:"

# Foreach loop statement to displays the values in the "$ProvincesArray" array
foreach ($Province in $ProvincesArray) {
    Write-Host - $Province
}