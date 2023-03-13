$url = "https://www.omnycontent.com/d/playlist/33dbd2dc-d464-471d-9feb-abae00330078/ed6f6972-a49d-4979-be1d-abae00cd3a92/70ce1b8c-8e0d-4029-9f69-abae00cd3a97/podcast.rss"
$downloadPath = "/tmp/podcasts/"

# Haal RSS-feed op
$response = Invoke-WebRequest $url
$feed = [xml]$reponse.Content

# Loop door elke item in de feed en download de bijbehorende MP3
foreach ($item in $feed.rss.channel.item) {
    $enclosure = $item.enclosure
    if ($enclosure -and $enclosure.type -eq "audio/mpeg") {
        $mp3Url = $enclosure.url
        $mp3Name = ($mp3Url.Split("/")[-1]).Split("?")[0]
        $mp3Path = Join-Path $downloadPath $mp3Name

        # Download MP3 als het bestand nog niet bestaat in de downloadmap
        if (!(Test-Path $mp3Path)) {
            Write-Host "Downloading $mp3Name ..."
            Invoke-WebRequest $mp3Url -OutFile $mp3Path
            Write-Host "Download complete."
        } else {
            Write-Host "$mp3Name already exists in download folder."
        }
    }
}

