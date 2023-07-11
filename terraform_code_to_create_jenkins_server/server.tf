data "aws_ami" "latest-amazon-linux-image"{
    most_recent = true
    owners = ["amazon"]
    filter{
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    filter{
        name = "virtualization-type"
        values = ["hvm"]
    }

}

resource "aws_instance" "jenkins-server" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = var.instance_type
    key_name = "jenkins-server"
    vpc_security_group_ids = [aws_security_group.maingroup.id]
    associate_public_ip_address = true
    user_data = file("jenkins-server-script.sh")
  
}

resource "aws_security_group" "maingroup" {
    name = "jenkins-sg"

    
    egress = [{
        cidr_blocks = ["0.0.0.0/0"]
        description = ""
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        protocol = "-1"
        from_port = 0
        to_port = 0
        self = false

    }]
    ingress = [
        {cidr_blocks = ["0.0.0.0/0",]
        description = ""
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        protocol = "tcp"
        from_port = 22
        to_port = 22
        self = false},

        {cidr_blocks = ["0.0.0.0/0",]
        description = ""
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        protocol = "tcp"
        from_port = 8080
        to_port = 8080
        self = false}
    ]
     
  
}