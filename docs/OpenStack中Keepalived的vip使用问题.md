* openstack的防火墙墙了vrrp协议的报文，可以在机器的安全组规则中添加对应的规则，vrrp协议的协议号是112。

* vip是选一个未被使用的fixedip，不被opentack认可，openstack底层的iptables设置也使得vip跟原有网络节点不通。解决的方法是用的Havana版本的一新特性 “Allowed-Address-Pairs”，具体操作是先创建一个port（即先创建一个fixed ip）：

  ```bash
  $ neutron port-create --fixed-ip ip_address=192.168.111.64 --security-group vrrp-sec-group vrrp-net
  ```

  然后给keepalived的机器分别做port-update，加上allwed_address_pairs ：

  ```bash
  neutron port-update --allowed-address-pair ip_address=[VIP/CIDR] [KEEPALIVED_PORT_ID]
  ```


#### 参考：

https://www.cnblogs.com/heitaoq/p/8973260.html

https://blog.csdn.net/chenwenhao0304/article/details/47380637