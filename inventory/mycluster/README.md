## 使用方式

执行下面的命令一键安装一个集群:

```
```

集群的信息:
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
  - 