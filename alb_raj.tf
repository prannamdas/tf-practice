resource "aws_lb" "aws_lb_raj" {
    name                = "aws-lb-raj"
    internal            = false
    load_balancer_type  = "application"
    security_groups     = [aws_security_group.aws_security_group_raj.id]
    subnets             = [aws_subnet.aws_zonea_public_subnet_raj.id,aws_subnet.aws_zoneb_public_subnet_raj.id]
}
 
resource "aws_lb_target_group" "aws_lb_target_group_raj" {
    name     = "aws-lb-target-group-raj"
    port     = "8080" 
    protocol = "HTTP"
    vpc_id   = aws_vpc.aws_vpc_raj.id
}

resource "aws_lb_listener" "aws_lb_listener_raj" {
    load_balancer_arn = aws_lb.aws_lb_raj.arn
    port              = "8080"
    protocol          = "HTTP"

    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.aws_lb_target_group_raj.arn
    }
}
