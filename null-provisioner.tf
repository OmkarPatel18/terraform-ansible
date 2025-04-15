resource "null_resource" "ansible_provision" {
  provisioner "local-exec" {
    command = "ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -i ../ansible/inventory ../ansible/n01617983-playbook.yml"
  }
}
