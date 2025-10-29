
Get-CimClass -ClassName Win32_Printer | Select-Object -ExpandProperty CimClassProperties

výpis na spodku súboru




Fax nemám :D 
PS C:\Users\tomas> Get-CimInstance -ClassName Win32_Printer | Where-Object { $_.Name -like '*Fax*' -or $_.DriverName -like '*Fax*' } | Select-Object Name, PortName, DriverName
PS C:\Users\tomas> Get-CimInstance -ClassName Win32_Printer | Select-Object Name, PortName, DriverName

Name                   PortName    DriverName
----                   --------    ----------
OneNote (Desktop)      nul:        Send to Microsoft OneNote 16 Driver
Microsoft Print to PDF PORTPROMPT: Microsoft Print To PDF

code by bol asi takto
$FaxName = "Microsoft Shared Fax Driver"
$NewLocation = "nowhere"

$FaxInstance = Get-CimInstance -ClassName Win32_Printer -Filter "Name='$FaxName'"
if ($FaxInstance) {
    Set-CimInstance -InputObject $FaxInstance -Property @{Location=$NewLocation}







výpis cim printer propertoes

    Name               : Caption
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MaxLen, read}
ReferenceClassName :

Name               : Description
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : InstallDate
Value              :
CimType            : DateTime
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, read}
ReferenceClassName :

Name               : Name
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : Status
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MaxLen, read, ValueMap}
ReferenceClassName :

Name               : Availability
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, read, ValueMap}
ReferenceClassName :

Name               : ConfigManagerErrorCode
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read, Schema, ValueMap}
ReferenceClassName :

Name               : ConfigManagerUserConfig
Value              :
CimType            : Boolean
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read, Schema}
ReferenceClassName :

Name               : CreationClassName
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {CIM_Key, read}
ReferenceClassName :

Name               : DeviceID
Value              :
CimType            : String
Flags              : Property, Key, ReadOnly, NullValue
Qualifiers         : {CIM_Key, read, Description, key…}
ReferenceClassName :

Name               : ErrorCleared
Value              :
CimType            : Boolean
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : ErrorDescription
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : LastErrorCode
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : PNPDeviceID
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read, Schema}
ReferenceClassName :

Name               : PowerManagementCapabilities
Value              :
CimType            : UInt16Array
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : PowerManagementSupported
Value              :
CimType            : Boolean
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : StatusInfo
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, read, ValueMap}
ReferenceClassName :

Name               : SystemCreationClassName
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {CIM_Key, Propagated, read}
ReferenceClassName :

Name               : SystemName
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {CIM_Key, Propagated, read}
ReferenceClassName :

Name               : AvailableJobSheets
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : Capabilities
Value              :
CimType            : UInt16Array
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ArrayType, ModelCorrespondence, read}
ReferenceClassName :

Name               : CapabilityDescriptions
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ArrayType, ModelCorrespondence, read}
ReferenceClassName :

Name               : CharSetsSupported
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ArrayType, MappingStrings, ModelCorrespondence, read}
ReferenceClassName :

Name               : CurrentCapabilities
Value              :
CimType            : UInt16Array
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : CurrentCharSet
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : CurrentLanguage
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read, ValueMap}
ReferenceClassName :

Name               : CurrentMimeType
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : CurrentNaturalLanguage
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : CurrentPaperType
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : DefaultCapabilities
Value              :
CimType            : UInt16Array
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : DefaultCopies
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : DefaultLanguage
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read, ValueMap}
ReferenceClassName :

Name               : DefaultMimeType
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : DefaultNumberUp
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : DefaultPaperType
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : DetectedErrorState
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, ModelCorrespondence, read}
ReferenceClassName :

Name               : ErrorInformation
Value              :
CimType            : StringArray
Flags              : Property, NullValue
Qualifiers         : {ModelCorrespondence, read, write}
ReferenceClassName :

Name               : HorizontalResolution
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : JobCountSinceLastReset
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Counter, read}
ReferenceClassName :

Name               : LanguagesSupported
Value              :
CimType            : UInt16Array
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, ModelCorrespondence, read, ValueMap}
ReferenceClassName :

Name               : MarkingTechnology
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, read, ValueMap}
ReferenceClassName :

Name               : MaxCopies
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : MaxNumberUp
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : MaxSizeSupported
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : MimeTypesSupported
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : NaturalLanguagesSupported
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ArrayType, MappingStrings, ModelCorrespondence, read}
ReferenceClassName :

Name               : PaperSizesSupported
Value              :
CimType            : UInt16Array
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : PaperTypesAvailable
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ArrayType, MappingStrings, ModelCorrespondence, read}
ReferenceClassName :

Name               : PrinterStatus
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {MappingStrings, read, ValueMap}
ReferenceClassName :

Name               : TimeOfLastReset
Value              :
CimType            : DateTime
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {read}
ReferenceClassName :

Name               : VerticalResolution
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {ModelCorrespondence, read}
ReferenceClassName :

Name               : Attributes
Value              :
CimType            : UInt32
Flags              : Property, NullValue
Qualifiers         : {BitValues, Description, MappingStrings, read…}
ReferenceClassName :

Name               : AveragePagesPerMinute
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Description, MappingStrings, read}
ReferenceClassName :

Name               : Comment
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Default
Value              :
CimType            : Boolean
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Description, MappingStrings, read}
ReferenceClassName :

Name               : DefaultPriority
Value              :
CimType            : UInt32
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Direct
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : DoCompleteFirst
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : DriverName
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : EnableBIDI
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : EnableDevQueryPrint
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : ExtendedDetectedErrorState
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Description, MappingStrings, ModelCorrespondence, read…}
ReferenceClassName :

Name               : ExtendedPrinterStatus
Value              :
CimType            : UInt16
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Description, MappingStrings, read, ValueMap…}
ReferenceClassName :

Name               : Hidden
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : KeepPrintedJobs
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Local
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Location
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Network
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Parameters
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : PortName
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : PrinterPaperNames
Value              :
CimType            : StringArray
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Description, MappingStrings, read}
ReferenceClassName :

Name               : PrinterState
Value              :
CimType            : UInt32
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {DEPRECATED, Description, MappingStrings, read…}
ReferenceClassName :

Name               : PrintJobDataType
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : PrintProcessor
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Priority
Value              :
CimType            : UInt32
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Published
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : Queued
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : RawOnly
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : SeparatorFile
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : ServerName
Value              :
CimType            : String
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {Description, MappingStrings, read}
ReferenceClassName :

Name               : Shared
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : ShareName
Value              :
CimType            : String
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : SpoolEnabled
Value              :
CimType            : Boolean
Flags              : Property, ReadOnly, NullValue
Qualifiers         : {DEPRECATED, Description, MappingStrings, read}
ReferenceClassName :

Name               : StartTime
Value              :
CimType            : DateTime
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : UntilTime
Value              :
CimType            : DateTime
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :

Name               : WorkOffline
Value              :
CimType            : Boolean
Flags              : Property, NullValue
Qualifiers         : {Description, MappingStrings, read, write}
ReferenceClassName :
