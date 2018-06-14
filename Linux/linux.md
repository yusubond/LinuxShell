## Linux相关问题及解法

---

1. 内核相关

```
make[4]: *** /lib/modules/4.4.0-112-generic/build: No such file or directory.  Stop.
```

这种情况下一般有两种情况：

有安装内核开发包，但是因为各种各样的原因没有识别。首先到/lib/modules/4.4.0-53-generic/（这里的版本号需要根据错误提示进入对应目录）目录下，查看是否有build文件：a.如果有的话，那么则是链接出错，ls -l命令查看build链接文件是否存在（如果链接文件标红则说明链接文件不存在了），去对应/usr/src目录下查看链接文件是否存在，一般都是链接这个目录下对应内核版本，如果存在，则重新链接，如果不存在则进入情况2（没有安装kernel开发包）；b.如果没有的话，则参照步骤a，查找源链接文件是否存在。
没有安全内核开发包，则直接使用系统版本管理工具下载对应kernel-devel即可。譬如Ubuntu是apt-get，centos是rpm，suse是zypper

解决办法：

```
#查看内核开发文件路径下对应文件名，这里在我的环境上是linux-headers-4.4.0-53-generic
ls /usr/src

cd /lib/modules/4.4.0-53-generic/
#链接文件
ln -s /usr/src/linux-headers-4.4.0-53-generic build
```

参考资料：[No such file or directory](https://blog.csdn.net/qq_15437667/article/details/69831509)

---

2. packet

ubuntu package XXX needs to be reinstalled, but I can't find an archive

解决办法：

```
# 备份dpkg状态文件
$ sudo cp /var/lib/dpkg/status status.bak

# 删除坏掉的package状态
$ sudo vim /var/lib/dpkg/status
$ apt-get -f install
```

参考资料： [@waitig](https://www.waitig.com/ubuntu-package-xxx-needs-to-be-reinstalled-but-i-cant-find-an-archive-%E4%BF%AE%E5%A4%8D.html)
