Breeze添加自定义组件事项：

1. 组件目录以`组件名-playbook`形式命名

2. 修改Breeze根目录init.sh，模仿原有模块添加组件版本的命令

3. components_order.conf中添加组件名

4. 组件目录结构说明：

   version目录：会被替换为具体版本号

   ​	file目录：存放组件按照要用到的各类文件

   ​	group_vars目录:  Ansible变量文件存放目录，初始为空，Breeze会在安装前将yat目录中的go模板文件处理后，放到本目录中，从而达到Ansible获取前端变量的目的。

   ​	template目录: 存放Ansible模板，采用jinja2。

   ​	yat目录： 存放Go template模板。必须有hosts.gotmpl，这是Ansible的hosts。

   ​	ansible.cfg： Ansible默认配置

   ​	inherent.yaml: 

   ​	init.sh: 该组件的初始化逻辑，可以在这下载组件安装包之类的操作

   ​	install.ansible: 该组件安装操作的playbook

   ​	reset.ansible: 该组件重置操作的playbook

   ​	properties.json: 定义web ui中该组件的配置项控件

