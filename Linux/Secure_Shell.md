## Secure Shell Protocol

### SSH Commands

`ssh`命令通过启动一个ssh client来建立与远端主机上ssh server的安全连接。因此，`ssh`命令可以用来登陆远程主机，传输文件以及在远端主机上执行命令等。

client端的ssh命令主要包括：

+ ssh-keygen : 生成一对密钥对，包含公钥与私钥

+ ssh-copy-id : 在server端配置用于鉴权公钥

+ ssh-agent : 管理私钥

+ ssh-add : 向ssh-agent添加私钥

+ scp : 类RPC命令接口的文件传输

+ sftp : 类FTP命令接口的文件传输

参考：[www.ssh.com/ssh/protocol](www.ssh.com/ssh/protocol)

### 配置ssh服务

  SSH分为客户端openssh-client和服务端openssh-server，根据需要自行安装即可。

  **安装客户端**

  ```
  # 安装客户端
  $ sudo apt-get install -y openssh-client

  # 安装服务端
  $ sudo apt-get install -y openssh-server

  # 默认情况下，安装后服务端自行启动；如果没有，则手动启动
  # 启动SSH服务sudo /etc/init.d/ssh start或者service ssh start

  # 查看启动情况，和监听端口
  $ ps -aux | grep ssh
  $ netstat -tlp   #tcp监听端口
  ```

  **安装服务端**

  ```
  # 安装服务端
  $ sudo apt-get install -y openssh-server
  ```

### 服务端配置公钥

  ```
  # /etc/ssh/目录下添加authorized_keys文件，权限600
  # 并将id_rsa.pub中的内容拷贝至该文件
  # 在/etc/ssh/sshd_config中添加以下字段
  $ AuthorizedKeysFile      /etc/ssh/authorized_keys
  ```

### 客户端配置私钥，别名，免密登录

  第一步：客户端ssh的配置文件(~/.ssh/config)添加以下信息:

  ```
  # 先确认/etc/ssh/ssh_config中是否打开ForwardAgent
  # ForwardAgent yes
  ```

  第二步：启动ssh-agent，并添加密钥

  ```
  $ eval $(ssh-agent -s)
  # 注意，一定要用eval，不能直接ssh-agent -s，否则无法添加密钥
  $ ssh-add ~/.ssh/id_rsa
  ```

  第三步：配置~/.ssh/config文件，添加别名及用户名信息等信息。  

  ```
  # ~/.ssh/config
  $ host alias_name
  $     IdentityFile ~/.ssh/id_rsa
  $     hostname host_ip
  $     user user_name

  # 经过以上配置，直接使用ssh alias_name即可
  ```
  
  需要注意的是：`.ssh`目录的权限需要为700，`authorized_keys`文件权限为600，且为登录用户及用户组所属

  参考链接:
  
  1. [博客园](http://www.cnblogs.com/ysocean/p/6959776.html)
  2. [ssh 建立信任关系后，仍需要输入密码](https://blog.csdn.net/qq_32239417/article/details/52774199)
