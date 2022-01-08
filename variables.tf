variable "linode_token" {}

variable "linode_ssh_key" {}

variable "linode_root_pass" {}

variable "linode_instance_name" {
  type        = string
  description = "Nome para a instancia (obrigatório)"
  default = "exemple-instance"
}