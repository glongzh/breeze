Breeze部署注意事项：

具体操作根据工具的部署文档操作，需注意的事项如下：

* 操作系统用CentOS7.4-7.6，minimal安装，干净的系统
* 用内网IP部署
* 系统没内置firewalld的话，先安装并启动
* 机器数量尽量按照文档要求，如果机器数量不够，master数量为1/3/5台，可以没有node，但安装完成后需要将master的污点去掉：`kubectl taint nodes --all node-role.kubernetes.io/master-`
* etcd也要集群安装，可以安装在各master上
* harbor安装在某一台master或node上都可以
* loadbalance组件需安装在每台master上，vip是指未被使用的虚拟IP，OpenStack虚拟机环境需要做些设置，具体看另一说明文档：《OpenStack中Keepalived的vip使用问题》；掩码根据IP段设置，后面两个route_id每个集群应设置不同值，避免冲突
* kubernetes组件中，如果只有master没有node，`kubenetes node hosts`就留空；`kubernetes entry point`如果有loadbalance组件，就填`VIP:6444`，如果没有就填`MASTER_IP:6443`
* prometheus组件在目前没有安装成功，不推荐安装。表现为alertmanager的pod不能正常运行，grafana页面看不到数据。具体原因不明，看不到log信息。目前判断可能是虚拟机环境原因。
* 如果要完全用我们自己构建相关镜像的话，还涉及到**yum-repo**，**deploy-ui**，**pagoda**，**kubeadm-version**这几个仓库

