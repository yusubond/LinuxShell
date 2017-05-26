## Ubuntu常用技巧

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
