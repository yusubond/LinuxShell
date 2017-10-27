### 配置ssh服务

  SSH分为客户端openssh-client和服务端openssh-server，根据需要自行安装即可。

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

### 向ssh-agent添加密钥

  第一步：向ssh的配置文件(~/.ssh/config)添加以下信息:

  ```
  # 先确认/etc/ssh/ssh_config中是否打开ForwardAgent
  # ForwardAgent yes

  # 在~/.ssh目录下创建config文件
  $ touch config
  # config内容：
  # Host *
  #   IdentityFile ~/.ssh/id_rsa
  # Host github.com
  #   IdentityFile ~/.ssh/github_rsa.priv
  #   User git
  ```

  第二步：启动ssh-agent，并添加密钥

  ```
  $ eval $(ssh-agent -s)
  # 注意，一定要用eval，不能直接ssh-agent -s，否则无法添加密钥
  $ ssh-add ~/.ssh/id_rsa
  ```

### 别名+免密钥登录设置

  第一步：在/etc/hosts中添加主机与ip的映射关系；  
  第二步：在~/.ssh/config文件中添加别名及用户名信息。  

  ```
  # /etc/hosts
  $ 192.168.10.10 master

  # ~/.ssh/config
  $ host my-master
  $ hostname 192.168.10.10
  $ user subond

  # 经过以上配置，直接使用ssh my-master即可
  ```

  参考链接:[博客园](http://www.cnblogs.com/ysocean/p/6959776.html)
