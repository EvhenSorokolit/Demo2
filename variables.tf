
variable "region" {
    description = " Enter region"
    default =  "eu-central-1"
}

variable "instance_type"{
    description = " Enter instance type"
    default          = "t2.micro"
}

variable "allow_ports"{
    description = "list of open ports"
    type = list
    default = ["80","22"]
}

variable "Sub_count"{
    description = "count of subnets and av.zones"    
    default = "2"
}


variable "VPC_Sidr_block"{
    description = "enter cidr block"
    type = string
    default = "10.0.0.0/16"
}
variable "common_tags" {
    description = "common tags to all resoutces"
    type = map
    default = {
         Owner = "Evhen Sorokolit"
         App = "MyAPP"
        
    }
}
variable "name" {
    description = " Enter name"
    default =  "My_WEB"
}