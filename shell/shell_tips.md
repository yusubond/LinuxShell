## Bash常用技巧

1. 查看端口占用情况

  ```
  # lsof -i:port_num
  # netstat -tunlp | grep port_num
  ```

2. 根据PID杀死进程

  ```
  # kill -9 PID_NUM
  ```
