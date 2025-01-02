## 简介

因为大陆管制, 本项目将国外的资源复制到国内, 所有用到的容器镜像都托管在了`registry.cn-beijing.aliyuncs.com/llaoj`下, 所有用到的二进制包, 都托管在了`https://llaoj.oss-cn-beijing.aliyuncs.com/files`下.  
另外, 还针对平时的需求对默认参数做了少量的定制.

## 使用方式

创建`inventory.ini`文件, 写清楚所有节点, 以及节点的角色. 执行下面的命令一键安装一个集群:

```sh
docker run --rm -t --net=host \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ${PWD}/inventory.ini:/kubespray/inventory/mycluster/inventory.ini \
  --entrypoint /bin/bash \
  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:v2.25.1-patch-0.2 \
  -c "ansible-playbook -i /kubespray/inventory/mycluster/inventory.ini cluster.yml -vvv"
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