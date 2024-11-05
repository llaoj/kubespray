#! /bin/bash -x

[ -n "${POD_CIDR}" ] && sed -i 's#kube_pods_subnet: 10.244.0.0/16#kube_pods_subnet: '"$POD_CIDR"'#g' inventory/yc-cluster/group_vars/k8s_cluster/k8s-cluster.yml

ansible-playbook -i inventory/yc-cluster/inventory.ini cluster.yml -vvv