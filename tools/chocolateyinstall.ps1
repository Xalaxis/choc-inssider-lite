$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://metageek.link/inssider-update-url-v1-0-2/inSSIDerSetup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'inSSIDer'

  checksum      = 'C3643B93118D0DF454298285E7C553470061F157810B705D747181C0E861CAE5'
  checksumType  = 'sha256'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Start-Sleep -Seconds 3 # Wait three seconds
Stop-Process -Name inSSIDer # Then kill process so main window doesn't open 