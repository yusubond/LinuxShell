# Linux bash应用实例

## 1.远程自动登录

### Linux expect的介绍

Expect是用于提供自动交互的工具，例如使用ssh或者telnet登入服务器时命令行下提示需要输入用户名和密码等。如果叫你用shell脚本写自动登录脚本的话是不是有点困难呢？ 你会说在shell中执行ssh命令的话，他会一直停在那里等你密码啊，这个要手工来做才行吧？

Expect就是为处理这种情况而设计的工具，简单来讲它可以控制、处理输入、输出流，然后提供自动填写数据等需要用户交互式输入的数据的地方实现自动化处理。

想要使用Expect，首先要熟练掌握Expect中定义的命令（expect,spawn,send,wait等等）。

### Expect自动登录实例

```
#!/usr/bin/expect
set timeout 30
spawn ssh -l myname 192.186.1.12
expect "password:"
send "123456\n"
interact
```

程序说明：

- spawn ssh -l myname 192.168.1.12

spawn命令是进入Expect环境后才可以执行Expect内部命令，它的主要功能就是给ssh运行进程加个壳，用来传递交互指令。

- expcet "password:"

expect是Expect的一个内部命令，这行代码的意思是判断场次输出的结果是否包含"password:"的字符串，如果有则立即返回，否则就等待一段时间后返回，这里等待时长就是前面设置的30秒。

- send "123456\n"

这里就是执行交互动作，与手工输入密码的动作等待。

- interact

执行完成后保持交互状态，把控制权交给控制台，这个时候就可以手工操作了。如果没有这一句登录完成后会退出，而不是留在远程终端上。如果你只是登录过去执行一段命令就退出，可改为`expect eof`。

## 2. Shell脚本创建新终端

```
gnome-terminal -t "titleName" -x bash -c "./run.sh;exec bash;"
```
-t 为打开的终端的标题，便于区分；
-x 后面的为在打开的终端中执行的脚本；
exec bash表示打开的终端在执行完脚本后不关闭。

#### 拓展

gnome-terminal技巧
