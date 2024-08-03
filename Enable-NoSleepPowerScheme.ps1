$ErrorActionPreference = "SilentlyContinue"
 
powercfg -restoredefaultschemes

$Balanced = (powercfg.exe /List | FINDSTR "(Balanced)")
$BalancedGUID = ($Balanced.split(" "))[3]

$Duplicated = (powercfg.exe /duplicatescheme $BalancedGUID)
$DuplicatedGUID = ($Duplicated.split(" "))[3]

$NewName = (powercfg.exe -changename $DuplicatedGUID "No Sleep")
$NoSleep = (powercfg.exe /List | FINDSTR "(No Sleep)")
$NoSleepGUID = ($NoSleep.split(" "))[3]

$PowerQuery = (powercfg /query)

# Hard Disk 

$HdSubGroupGUID = (($PowerQuery | FIND " (Hard disk)").split(" "))[4]

$HdAfterGUID = ((($PowerQuery | FIND " (Turn off hard disk after)").trimstart(" ")).split(" "))[3]

# Internet Explorer
# NOTE: The following Internet Explorer Power Settings have been Disabled, as they are No Longer Supported.

#$IeSubgroupGUID = (($PowerQuery | FIND " (Internet Explorer)").split(" "))[4]

#$IeJsSettingGUID = ((($PowerQuery | FIND " (JavaScript Timer Frequency)").trimstart(" ")).split(" "))[3]

# Desktop Backgroup Settings

$DesktopSubgroupGUID = (($PowerQuery | FIND " (Desktop background settings)").split(" "))[4]

$DesktopSlidshowGUID = ((($PowerQuery | FIND " (Slide show)").trimstart(" ")).split(" "))[3]

# Wireless Adapter Settings

$WiFiSubgroupGUID = (($PowerQuery | FIND " (Wireless Adapter Settings)").split(" "))[4]

$WiFiPowerGUID = ((($PowerQuery | FIND " (Power Saving Mode)").trimstart(" ")).split(" "))[3]

# Sleep Settings

$SleepSubgroupGUID = (($PowerQuery | FIND " (Sleep)").split(" "))[4]

$SleepAfterGUID = ((($PowerQuery | FIND " (Sleep after)").trimstart(" ")).split(" "))[3]

$HybridSleepGUID = ((($PowerQuery | FIND " (Allow hybrid sleep)").trimstart(" ")).split(" "))[3]

$HybernateAfterGUID = ((($PowerQuery | FIND " (Hibernate after)").trimstart(" ")).split(" "))[3]

$WakeTimersGUID = ((($PowerQuery | FIND " (Allow wake timers)").trimstart(" ")).split(" "))[3]

# USB Settings

$UsbSubgroupGUID = (($PowerQuery | FIND " (USB settings)").split(" "))[4]

$UsbSuspendGUID = ((($PowerQuery | FIND " (USB selective suspend setting)").trimstart(" ")).split(" "))[3]

# Graphics Settings

$GraphicsSubgroupGUID = (($PowerQuery | FIND " (Intel(R) Graphics Settings)").split(" "))[4]

$GraphicsPowerGUID = ((($PowerQuery | FIND " (Intel(R) Graphics Power Plan)").trimstart(" ")).split(" "))[3]

# Power Buttons & Lid Settings

$ButtonsSubgroupGUID = (($PowerQuery | FIND " (Power buttons and lid)").split(" "))[4]

$StartMenuGUID = ((($PowerQuery | FIND " (Start menu power button)").trimstart(" ")).split(" "))[3]

# PCI Express Settings

$PcieSubgroupGUID = (($PowerQuery | FIND " (PCI Express)").split(" "))[4]

$LinkStateGUID = ((($PowerQuery | FIND " (Link State Power Management)").trimstart(" ")).split(" "))[3]

# Processor Power Management Settings

$CpuSubgroupGUID = (($PowerQuery | FIND " (Processor power management)").split(" "))[4]

$MinCpuStateGUID = ((($PowerQuery | FIND " (Minimum processor state)").trimstart(" ")).split(" "))[3]

$CoolingPolicyGUID = ((($PowerQuery | FIND " (System cooling policy)").trimstart(" ")).split(" "))[3]

$MaxCpuStateGUID = ((($PowerQuery | FIND " (Maximum processor state)").trimstart(" ")).split(" "))[3]

# Display Settings

$DisplaySubgroupGUID = (($PowerQuery | FIND " (Display)").split(" "))[4]

$DisplayAfterGUID = ((($PowerQuery | FIND " (Turn off display after)").trimstart(" ")).split(" "))[3]

$DisplayBrightnessGUID = ((($PowerQuery | FIND " (Display brightness)").trimstart(" ")).split(" "))[3]

$DimmedBrightnessGUID = ((($PowerQuery | FIND " (Dimmed display brightness)").trimstart(" ")).split(" "))[3]

$AdaptiveBrightnessGUID = ((($PowerQuery | FIND " (Enable adaptive brightness)").trimstart(" ")).split(" "))[3]

$AdaptiveBrightnessGUID = ((($PowerQuery | FIND " (Enable adaptive brightness)").trimstart(" ")).split(" "))[3]

# MultiMedia Settings
# NOTE: The following MultiMedia Power Settings have been Disabled, as they are No Longer Supported.

#$MediaSubgroupGUID = (($PowerQuery | FIND " (Multimedia settings)").split(" "))[4]

#$MediaSharingGUID = ((($PowerQuery | FIND " (When sharing media)").trimstart(" ")).split(" "))[3]

#$VideoPlaybackGUID = ((($PowerQuery | FIND " (Video playback quality bias)").trimstart(" ")).split(" "))[3]

#$PlayingVideoGUID = ((($PowerQuery | FIND " (When playing video)").trimstart(" ")).split(" "))[3]

# Battery Settings

$BatterySubgroupGUID = (($PowerQuery | FIND " (Battery)").split(" "))[4]

$CriticalNotifyGUID = ((($PowerQuery | FIND " (Critical battery notification)").trimstart(" ")).split(" "))[3]

$CriticalActionGUID = ((($PowerQuery | FIND " (Critical battery action)").trimstart(" ")).split(" "))[3]

$LowLevelGUID = ((($PowerQuery | FIND " (Low battery level)").trimstart(" ")).split(" "))[3]

$CriticalLevelGUID = ((($PowerQuery | FIND " (Critical battery level)").trimstart(" ")).split(" "))[3]

$LowNotifyGUID = ((($PowerQuery | FIND " (Low battery notification)").trimstart(" ")).split(" "))[3]

$LowActionGUID = ((($PowerQuery | FIND " (Low battery action)").trimstart(" ")).split(" "))[3]

$ReserveLevelGUID = ((($PowerQuery | FIND " (Reserve battery level)").trimstart(" ")).split(" "))[3]




$DcWifi = (powercfg /SETDCVALUEINDEX $NoSleepGUID $WiFiSubgroupGUID $WiFiPowerGUID 0)

$AcWifi = (powercfg /SETACVALUEINDEX $NoSleepGUID $WiFiSubgroupGUID $WiFiPowerGUID 0)


# Sleep - Sleep After - Never

$DcSleep = (powercfg /SETDCVALUEINDEX $NoSleepGUID $SleepSubgroupGUID $SleepAfterGUID 0)

$AcSleep = (powercfg /SETACVALUEINDEX $NoSleepGUID $SleepSubgroupGUID $SleepAfterGUID 0)


# Allow Hybrid Sleep - Never

$DcHybridSleep = (powercfg /SETDCVALUEINDEX $NoSleepGUID $SleepSubgroupGUID $HybridSleepGUID 0)

$AcHybridSleep = (powercfg /SETACVALUEINDEX $NoSleepGUID $SleepSubgroupGUID $HybridSleepGUID 0)


# Hibernate After - Never

$DcHybridAfter = (powercfg /SETDCVALUEINDEX $NoSleepGUID $SleepSubgroupGUID $HybernateAfterGUID 0)

$AcHybridAfter = (powercfg /SETACVALUEINDEX $NoSleepGUID $SleepSubgroupGUID $HybernateAfterGUID 0)


# Intel(R) Graphics Settings - Intel(R) Graphics Power Plan - Maximum Performance

$DcGraphicsMax = (powercfg /SETDCVALUEINDEX $NoSleepGUID $GraphicsSubgroupGUID $GraphicsPowerGUID 2)

$AcGraphicsMax = (powercfg /SETACVALUEINDEX $NoSleepGUID $GraphicsSubgroupGUID $GraphicsPowerGUID 2)


# Power buttons and lid - Lid close action - Do Nothing

$DcPowerButtons = (powercfg /SETDCVALUEINDEX $NoSleepGUID $ButtonsSubgroupGUID $StartMenuGUID 0)

$AcPowerButtons = (powercfg /SETACVALUEINDEX $NoSleepGUID $ButtonsSubgroupGUID $StartMenuGUID 0)


# Display - Turn off display after - Never

$DcTurnOffDisplay = (powercfg /SETDCVALUEINDEX $NoSleepGUID $DisplaySubgroupGUID $DisplayAfterGUID 0)

$AcTurnOffDisplay = (powercfg /SETACVALUEINDEX $NoSleepGUID $DisplaySubgroupGUID $DisplayAfterGUID 0)


# USB settings - USB selective suspend setting - Disabled

$DcUsbSettings = (powercfg /SETDCVALUEINDEX $NoSleepGUID $UsbSubgroupGUID $UsbSuspendGUID 0)

$AcUsbSettings = (powercfg /SETACVALUEINDEX $NoSleepGUID $UsbSubgroupGUID $UsbSuspendGUID 0)


# PCI Express - Link State Power Management - Off

$DcPciExpress = (powercfg /SETDCVALUEINDEX $NoSleepGUID $PcieSubgroupGUID $LinkStateGUID 0)

$AcPciExpress = (powercfg /SETACVALUEINDEX $NoSleepGUID $PcieSubgroupGUID $LinkStateGUID 0)


# Processor power management - Minimum processor state - Maximum Possible Setting

$DcCpuMax = (powercfg /SETDCVALUEINDEX $NoSleepGUID $CpuSubgroupGUID $MaxCpuStateGUID 100)

$AcCpuMax = (powercfg /SETACVALUEINDEX $NoSleepGUID $CpuSubgroupGUID $MaxCpuStateGUID 100)


# Processor power management - Maximum processor state - Minimum Possible Setting

$DcCpuMin = (powercfg /SETDCVALUEINDEX $NoSleepGUID $CpuSubgroupGUID $MinCpuStateGUID 100)

$AcCpuMin = (powercfg /SETACVALUEINDEX $NoSleepGUID $CpuSubgroupGUID $MinCpuStateGUID 100)


# Processor power management - System Cooling Policy - Active

$DcCpuCooling = (powercfg /SETDCVALUEINDEX $NoSleepGUID $CpuSubgroupGUID $CoolingPolicyGUID 0)

$AcCpuCooling = (powercfg /SETACVALUEINDEX $NoSleepGUID $CpuSubgroupGUID $CoolingPolicyGUID 1)

# Add Ultimate Performance Power Scheme

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >$null 2>&1

# Set "No Sleep" Power Plan to Active

powercfg /SETACTIVE $NoSleepGUID

# Display Current Power Plan

powercfg /LIST

Write-Host "`n"
