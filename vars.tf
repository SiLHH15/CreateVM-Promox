variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN6h2pmUKzilLZL23/emBAa4qegpAOVkhOGI+VOEEMbxvPXEArdgtgW+2NFg8XoWoBg6Rm0rvpgbj3gNVccXQWxOD1vlzdeVnxsgOH6SpEaRkFvjpK88ZmhZoOtr4ALVYkp8nFFL6SU6NLtPW8Cq2y9Fb64VaYCZLnwHhKaq0do4/eB7WTklV2+iKJbTWiae3EnqHOiY0xk+NKu7FW34D6tFgay1RHvO2hCExopQSVPB/NJ7L4GiDIcxhbCQnfOkxulJZs4KQzoEdToQXAl+Ix5NDYbP7ZnjZGaQWCyGIbVeXmdINUSsZi8l/rRTkS4Ikt8PQTB7c3l0sVyBUOgarua+SkoKi+WWJStozLogz0GJiG+9sZM7wcfHm9iklqDsx+m9se1mCeD9B5N+0G74JAbgCwLu4902CBG0eDK3ovsIB+CwIef7X+iqQ5X/eH+KT/xRhqtLVsgDDnUexdOBsLuwzo4lp2j2ULJ8ouBryBAyqohYtwANXVyR47VzN1RSFv9QfGZGopDM8alqqY7mZJz3ZkHponT6ZnnvfXMgjd/EAzksK3Qo+kWS2GAEdZ9sgtFtQkrjae4Lm24BYbz+m7YHhNSxJzNli+YnnAFJNXsviWtnAktlFFLmawpML8IbKX78gxnS07jeDNE1QHPIvKp+Kg0sr39uHrvTwbkV6okw== root@promox"
}

variable "proxmox_host" {
    default = "promox"
}

variable "template_name" {
    default = "debian-11-cloudinit-template"
}
variable "ipconfig0_list" {
  description = "List of IP configuration strings for VMs"
  type        = list(string)
  default     = [
    "ip=192.168.157.200/24,gw=192.168.157.2",
    "ip=192.168.157.201/24,gw=192.168.157.2",
    "ip=192.168.157.202/24,gw=192.168.157.2",
  ]
}
