# Open and close social media applications
# ( If one or more social are open - Close them all )
# ( If the socials are close - Open them all )

# User name

$path = [Environment]::GetFolderPath("User")

# Creation application path

$discord_path  = $path + "\AppData\Local\Discord\Update.exe" 
$whatsapp_path = $path + "\AppData\Local\WhatsApp\WhatsApp.exe"
$telegram_path = $path + "\AppData\Roaming\Telegram Desktop\Telegram.exe"

# Creation flag for the program if needed

$discord_flags = '--processStart' , 'Discord.exe'

# Check if the process of each social is running )

$discord = Get-Process discord -ErrorAction SilentlyContinue
$whatsapp = Get-Process whatsapp -ErrorAction SilentlyContinue
$telegram = Get-Process telegram -ErrorAction SilentlyContinue

# If any social is running kill all of them, otherwise open all of them

if ($discord -or $whatsapp -or $telegram) {
    
    Stop-Process -Name discord
    Stop-Process -Name whatsapp
    Stop-Process -Name telegram

}

else {

    & $discord_path $discord_flags
    & $whatsapp_path
    & $telegram_path 
    
}

# Delete all the variables

Remove-Variable path
Remove-Variable discord_path
Remove-Variable discord_flags
Remove-Variable whatsapp_path
Remove-Variable telegram_path
Remove-Variable discord
Remove-Variable whatsapp
Remove-Variable telegram
