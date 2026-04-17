## gen offline file & image

```sh
IMAGE_TAG=	v2.21.0-kata-0.11
docker run --rm -t --net=host --entrypoint=bash \
  -v ./contrib:/kubespray/contrib \
  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:${IMAGE_TAG} \
  -c "/kubespray/contrib/offline/generate_list.sh"
```

## checksum

```sh
scripts/download_hash.sh v1.25.12
```
write to `roles/download/defaults/main.yml`

## Copy image from ACR to COSMOPlat

```sh
IMAGE_TAG=	v2.21.0-kata-0.11
docker pull registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:${IMAGE_TAG}
docker tag  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:${IMAGE_TAG} registry2-qingdao.cosmoplat.com/64_paas/kubespray_kubespray:${IMAGE_TAG}
docker push registry2-qingdao.cosmoplat.com/64_paas/kubespray_kubespray:${IMAGE_TAG}

```

## 执行部署

Create inventroy file in `/tmp/inventory.ini` and run:

```sh
IMAGE_TAG=	v2.21.0-kata-0.11
docker run --rm -t --net=host --entrypoint=/bin/bash \
  -v ${HOME}/.ssh:/root/.ssh \
  -v /tmp/inventory.ini:/kubespray/inventory/my-cluster/inventory.ini \
  registry.cn-beijing.aliyuncs.com/llaoj/kubespray_kubespray:${IMAGE_TAG} \
  -c "ansible-playbook -i inventory/my-cluster/inventory.ini cluster.yml"
```
