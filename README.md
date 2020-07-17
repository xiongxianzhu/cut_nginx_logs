# cut_nginx_logs

按日期切割nginx日志文件并定时清理日志文件

#### 1. linux下安装crontab

`for debian`:

```
apt-get install cron
systemctl restart cron
```

#### 2. 使用说明

将脚本`cut_nginx_logs.sh`拷贝到服务器目录`home/<用户名>/scripts/`下，如下：

```
mkdir -p /home/xx/scripts
cd /home/xx/scripts
git clone git@github.com:xiongxianzhu/cut_nginx_logs.git
mv ./cut_nginx_logs/cut_nginx_logs.sh cut_nginx_logs.sh 
```

根据自身服务器的环境， 修改变量`log_dir`, `nginx_bin`和`save_days`的值

结合crontab实现定时执行脚本`cut_nginx_logs.sh`文件

在crontab添加定时任务:

```
vim /etc/crontab
```

追回的内容如下：


```
59 23 * * * sleep 56;sh /home/work/scripts/cut_nginx_logs.sh >/dev/null 2>&1
```

重启crontab服务:

```
systemctl restart cron
```