## Modificaton History

### oaiepc charm(/home/luhan/trusty/oai-epc)

+ changed default branch to "master" in config.yaml("v0.3.2-branch")
+ move the kernel to 4.7.7 version in utils/common
+ fix the install in hooks
+ changed epc_exec_name in utils/common
+ add epc_mme and epc_spgw in files  # the second choice
+ changed run_mme and run_spgw in files/mme_gw  # the first choice
+ changed mme.conf and spgw.conf in config-changed (replace epc.conf)
+ replace epc_conf with mme.conf and spgw.conf in utils/common
+ add check_spgw_connection() in utils/common
+ add service epc_mme.conf and epc_spgw.conf to system
+ fix juju-log and status-set for epc_mme and epc_spgw

### oaisim charm

---

### juju cmd

1. 部署服务

`juju deploy --repository=/home/luhan/charms local:trusty/oai-epc --constraints "mem=4G cpu-cores=1" --to machine_id service_name`


### 辅助信息

hooks执行顺序：install -> config-changed -> start -> update-status(waiting for hss) -> hss-relation-joined -> hss-relation-changed ->

the successful log of `build_mme -c`

```
Clean the build generated files (build from scratch)
mkdir: created directory 'BUILD'
Build type is Debug
Architecture is x86_64
git found: /usr/bin/git
mme compiled
'/srv/openair-cn/BUILD/MME/BUILD/mme' -> '/usr/local/bin/mme'
mme installed
auth_request compiled
'/srv/openair-cn/BUILD/MME/BUILD/auth_request' -> '/usr/local/bin/auth_request'
auth_request installed
```

the successful log of `build_spgw -c`

```
Clean the build generated files (build from scratch)
mkdir: created directory 'BUILD'
Build type is Debug
Architecture is x86_64
git found: /usr/bin/git
spgw compiled
'/srv/openair-cn/BUILD/SPGW/BUILD/spgw' -> '/usr/local/bin/spgw'
spgw installed

```
