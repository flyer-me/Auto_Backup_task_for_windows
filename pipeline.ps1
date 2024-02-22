# ����Ҫѹ����Ŀ¼��ѹ������ļ���
$sourceFolder = "C:\Program Files\PalServer\steam\steamapps\common\PalServer\Pal\Saved"
$zipFile = "C:\Users\Administrator\OneDrive\auto_PAL_Backup.zip"

if(Test-Path $zipFile) {
    Remove-Item $zipFile
}
# ����ѹ���ļ�
Add-Type -A 'System.IO.Compression.FileSystem'
[System.IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder, $zipFile)

<#
$taskName = "ZipAndSendTask"
# ����ÿ��9��ִ�еļƻ�����
Unregister-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -File "C:\Users\Administrator\Desktop\pipeline.ps1"'
$trigger = New-ScheduledTaskTrigger -Once -At "00:00" -RepetitionInterval (New-TimeSpan -Hours 12) -RepetitionDuration (New-Timespan -Hours 2400)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "ZipAndSendTask" -Description "�Զ�����PALsave" -User "SYSTEM"
#>

