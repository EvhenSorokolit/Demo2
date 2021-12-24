/*output "Webserver_instance_id" {
  value = aws_instance.my_web.id
  
}

output "Webserver_public_ip_addr" {
  value = aws_eip.my_static_ip.public_ip
  
}
output "Webserver_public_SG_id" {
  value = aws_security_group.my_web.id
  
}
*/
#~~~~~~~~~output~~~~~~~~~~~~~~~
output "web_loadbalancer_url"{
 
    value = aws_lb.my_web_lb.dns_name
}