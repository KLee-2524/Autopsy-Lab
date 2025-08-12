output "autopsy_details" {
    value = {
        name = aws_instance.autopsy-vm.tags["Name"]
        pub_ip = aws_instance.autopsy-vm.public_ip
    }
    description = "Autopsy VM EC2 instance details"
}