variable "vpc_id" {
    description = "ID of the lab vpc"
    type        = string
}

variable "attendee_number" {
    description = "Used to create a separate subnet for each individual attendee"
    type        = string
}

variable "route_table_id" {
    description = "ID of the route table"
    type        = string
}

variable "availability_zone" {
    description = "AWS availability zone where resources will be deployed"
    type        = string
    default     = "us-west-1a" 
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.medium"
}

variable "windows_ami" {
    description = "AMI of the WinSer VM to deploy"
    type        = string
    default     = "ami-0d94c1edb53740e3c"

    # WinSer22 = "ami-06fe666da1b90024e"
    # WinSer16 = "ami-09896dc1e97cae396"
    # Ubuntu 22.04 = "ami-043b59f1d11f8f189"
}

variable "setup_script" {
    description = "Set script to configure Windows VM with autopsy upon deployment"
    type        = string
    default     = <<-EOT
    <powershell>
    $autopsy_installer = "https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.22.1/autopsy-4.22.1-64bit.msi"
    $installer_path = "C:\Users\Administrator\Downloads\autopsy-4.22.1-64bit.msi"

    Start-Process $autopsy_installer -Wait
    Start-Process msiexec.exe "/i $installer_path /qn" -Wait
    </powershell>
    EOT
}