# Load iCal.NET assembly
Add-Type -Path "/tmp/Ical.Net.dll"

$calendar = New-Object Ical.Net.Calendar
$url = "https://racingnews365.com/ics/download/calendar-formula-2023.ics?all"
$response = Invoke-WebRequest -Uri $url

$calendar = [Ical.Net.Calendar]::Load( $response.Content )

$entries = New-Object System.Collections.ArrayList
# Loop through each event in the calendar
foreach ($item in $calendar.Events) {

	$entry = New-Object System.Object
	$entry | Add-Member -MemberType NoteProperty -Name "Summary" -Value $item.Summary
	$entry | Add-Member -MemberType NoteProperty -Name "Description" -Value $item.Description
	$entry | Add-Member -MemberType NoteProperty -Name "StartDate" -Value $item.Start.LocalDateTime
	$entry | Add-Member -MemberType NoteProperty -Name "EndDate" -Value $item.End.LocalDateTime
	$entries.Add($entry) > $null
}

$entries | ConvertTo-Html -Title "Race kalender" | Out-File "calendar.html"