resource "aws_instance" "web" {
  count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["allow_ssh", "port9966"]
  user_data = "${file("deploy.sh")}"

  tags = {
    Name = "Spring"
  }
}
