$citiesArray = "Mecca","Jeddah","Jazan","Riyadh"
Write-Host "Cities of Saudi Arabia:"
foreach ($city in $citiesArray)
{  Write-Host - $city
}

$hashTable = @{ key1 = 1; key2 = 2; key3 = 3; key4 = 4; key5 = 5}
foreach ($key in $hashTable.keys)
{  Write-Host "Key: $key, Value: $($hashTable[$Key])"
}