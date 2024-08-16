# rclone-aliyundrive-shell
Mount ALiYun Web Drive to local disk /mnt/aliyun

# Prerequisites
```
sudo apt install fuse rclone pipx
sudo pipx install aliyundrive-webdav
```

# Usage
You should place this script at /root/, 
then open aliyun.sh in text editor, then replace {token} with the exact token string that you extract from here: how to fetch the token [refresh token]：[点我获取refresh token](https://github.com/messense/aliyundrive-webdav#%E8%8E%B7%E5%8F%96-refresh-token)

# Install
You can test the script to see if it works as expected , if it works , then you should able to see that files/directories in AliYun Drive has been mounted in the directory /mnt/aliyun  
```
sudo chmod +x /root/aliyun.sh && sudo /root/aliyun.sh
```

# Run the script as a system service
Please read the instruction in the scripts.
