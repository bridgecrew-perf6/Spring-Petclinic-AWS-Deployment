resource "aws_instance" "web" {
  count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["allow_ssh", "port8080", "port80"]
  key_name      = "frontend-key"

  tags = {
    Name = "Spring"
  }

  connection {
        type        = "ssh"
        host        = "${self.public_ip}"
        user        = "ubuntu"
        private_key = "${file("~/.ssh/id_rsa")}"
    }


  provisioner "file" {
    source      = "../modules/frontend/deploy.sh "
      destination = "/tmp/deploy.sh"
  }  
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/deploy.sh",
      "cd /tmp/",
      "sed -i -e 's/\r$//' deploy.sh",
      "./deploy.sh",
    ]
  }
}

resource "aws_key_pair" "frontend-key" {
  key_name   = "frontend-key"
  public_key = file("~/.ssh/id_rsa.pub")
}