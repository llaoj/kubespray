## 使用方式

创建`inventory.ini`文件, 写清楚所有节点, 以及节点的角色. 执行下面的命令一键安装一个集群:

```sh
docker run --rm -t --net=host \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ./inventory.ini:/kubespray/inventory/mycluster/inventory.ini \
  --entrypoint /bin/bash \
  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:v2.25.1-patch-0.1 \
  -c "ansible-playbook -i /kubespray/inventory/inventory.ini cluster.yml -vvv"
```
## 集群信息

使用上面的命令创建的集群信息:

- Kuberenetes version 1.29.10
  - with:
    - containerd
    - service cidr: 10.233.0.0/16
    - pod cidr: 10.244.0.0/16
    - coredns+nodelocaldns(169.254.25.10)
    - calico vxlan mode
- Addons:
  - ingress-nginx
  - helm