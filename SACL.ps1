$AuditUser_S = "Everyone"
$AuditRules_S = "Delete,DeleteSubdirectoriesAndFiles,CreateFiles,AppendData,Write"
$InheritType_S = ("ContainerInherit,ObjectInherit")
$AuditType_S = "Success"
$AccessRule_S = New-Object System.Security.AccessControl.FileSystemAuditRule($AuditUser_S,$AuditRules_S,$InheritType_S,"None",$AuditType_S)

$AuditUser_F = "Everyone"
$AuditRules_F = "Delete,DeleteSubdirectoriesAndFiles,CreateFiles,AppendData,Write,ExecuteFile,TakeOwnership,FullControl"
$InheritType_F = ("ContainerInherit,ObjectInherit")
$AuditType_F = "Failure"
$AccessRule_F = New-Object System.Security.AccessControl.FileSystemAuditRule($AuditUser_F,$AuditRules_F,$InheritType_F,"None",$AuditType_F)

$DrivePath = "C:\users\Public\Alex"
$ACL = Get-Acl $DrivePath
$ACL.SetAuditRule($AccessRule_S)
$ACL.AddAuditRule($AccessRule_F)
#$ACL.SetAuditRule($AccessRule_F)
#Inheritance True or False?
$ACL.SetAuditRuleProtection($True, $True)
$ACL | Set-Acl $DrivePath

#AppendData: Specifies the right to append data to the end of a file.
#ChangePermissions: Specifies the right to change the security and audit rules associated with a file or folder.
#CreateDirectories: Specifies the right to create a folder.
#CreateFiles: Specifies the right to create a file.
#Delete: Specifies the right to delete a folder or file.
#DeleteSubdirectoriesAndFiles: Specifies the right to delete a folder and any files contained within that folder.
#ExecuteFile: Specifies the right to run an application file.
#ListDirectory: Specifies the right to read the contents of a directory.
#ReadAttributes: Specifies the right to open and copy file system attributes from a folder or file. For example, this value specifies the right to view the file creation or modified date. This does not include the right to read data, extended file system attributes, or access and audit rules.
#ReadData: Specifies the right to open and copy a file or folder. This does not include the right to read file system attributes, extended file system attributes, or access and audit rules.
#ReadExtendedAttributes: Specifies the right to open and copy extended file system attributes from a folder or file. For example, this value specifies the right to view author and content information. This does not include the right to read data, file system attributes, or access and audit rules.
#ReadPermissions: Specifies the right to open and copy access and audit rules from a folder or file. This does not include the right to read data, file system attributes, and extended file system attributes.
#Synchronize: Specifies whether the application can wait for a file handle to synchronize with the completion of an I/O operation.
#TakeOwnership: Specifies the right to change the owner of a folder or file. Note that owners of a resource have full access to that resource.
#Traverse: Specifies the right to list the contents of a folder and to run applications contained within that folder.
#WriteAttributes: Specifies the right to open and write file system attributes to a folder or file. This does not include the ability to write data, extended attributes, or access and audit rules.
#WriteData: Specifies the right to open and write to a file or folder. This does not include the right to open and write file system attributes, extended file system attributes, or access and audit rules.
#WriteExtendedAttributes: Specifies the right to open and write extended file system attributes to a folder or file. This does not include the ability to write data, attributes, or access and audit rules.
