resource "aws_instance" "web" {
  count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["allow_ssh", "port9966", "port80"]
  key_name      = "frontend-key"

  tags = {
    Name = "Spring"
  }

  connection {
        type        = "ssh"
        host        = "ec2-${self.public_ip}.us-east-2.compute.amazonaws.com"
        user        = "ubuntu"
        private_key = "${file("~/.ssh/id_rsa")}"
    }


  provisioner "file" {
    source      = "~/deploy.sh"
    destination = "/tmp/deploy.sh"
  }  
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/deploy.sh",
      "sudo /tmp/deploy.sh",
    ]
  }
}

resource "aws_key_pair" "frontend-key" {
  key_name   = "frontend-key"
  public_key = file("~/.ssh/id_rsa.pub")
}