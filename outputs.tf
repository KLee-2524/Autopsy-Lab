output "lab_instances" {
    value = {
        for attendee, mod in module.autopsy-lab :
        attendee => {
            VM_name   = module.autopsy-lab["${attendee}"].autopsy_details.name
            VM_pub_ip = module.autopsy-lab["${attendee}"].autopsy_details.pub_ip
        }
    }
}