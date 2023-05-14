resource "aws_launch_configuration" "aws_launch_configuration_raj" {
    name_prefix     = "aws_launch_configuration_raj"
    image_id        = var.ami
    instance_type   = var.instance_type
    user_data       = file("user-data.sh")
    security_groups = [aws_security_group.aws_security_group_raj.id]

    lifecycle {
      create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "aws_autoscaling_group_raj" {
    name                 = "aws_autoscaling_group_raj"
    min_size             = 1
    max_size             = 3
    desired_capacity     = 2
    launch_configuration = aws_launch_configuration.aws_launch_configuration_raj.name
    vpc_zone_identifier  = [aws_subnet.aws_zonea_public_subnet_raj.id,aws_subnet.aws_zoneb_public_subnet_raj.id]

    tag {
        key                 = "Name"
        value               = "alpha-auto-scaling-group"
        propagate_at_launch = true
    }
}

resource "aws_autoscaling_attachment" "aws_autoscaling_attachment_raj" {
    autoscaling_group_name = aws_autoscaling_group.aws_autoscaling_group_raj.id
    lb_target_group_arn    = aws_lb_target_group.aws_lb_target_group_raj.arn
}
