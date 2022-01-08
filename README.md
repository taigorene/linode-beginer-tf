# Terraform para criação de cluster K8 (Kind)

Esse repo contém o script [Terraform](https://www.terraform.io/) para criação de um servidor, firewall, domínio e registro DNS no [linode](https://cloud.linode.com/).

Base usada para demonstrações e estudo.

## Notas
No repositório local, é preciso criar um arquivo com as variáveis que são sensíveis e tem que permanecer seguras. Exemplo:

Nome: `terraform.tfvars`.
```
linode_token = "<<token do linode para acesso>>"
linode_ssh_key = "ssh-rsa AAAABCDS... <<email>>"
linode_root_pass = "<<password root para acesso>>"
```

## Maintainer
Mantido por [Taígo](https://github.com/taigorene).
Baseado na configuração do [Sid](https://www.youtube.com/watch?v=C3ptdKC9-EQ).