## gen offline file & image

```sh
docker run --rm -t --net=host --entrypoint=bash \
  -v ./contrib:/kubespray/contrib \
  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:v2.21.0-kata-0.3 \
  -c "/kubespray/contrib/offline/generate_list.sh"
```

## Copy image from ACR to COSMOPlat

```sh
TAG=v2.21.0-kata-0.3
docker pull registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:${TAG}
docker tag  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:${TAG} registry2-qingdao.cosmoplat.com/64_paas/kubespray_kubespray:${TAG}
docker push registry2-qingdao.cosmoplat.com/64_paas/kubespray_kubespray:${TAG}

```

## 执行部署

Create inventroy file in `/tmp/inventory.ini` and run:

```sh
docker run --rm -t --net=host --entrypoint=/bin/bash \
  -v ${HOME}/.ssh:/root/.ssh \
  -v /tmp/inventory.ini:/kubespray/inventory/my-cluster/inventory.ini \
  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:v2.21.0-kata-0.3 \
  -c "ansible-playbook -i inventory/my-cluster/inventory.ini cluster.yml -vvv"
```
