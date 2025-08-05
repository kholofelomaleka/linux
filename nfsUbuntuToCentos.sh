# UBUNTU

sudo apt update;
sudo apt install nfs-kernel-server;
sudo mkdir /nfs_share
sudo chmod -R 777 /nfs_share
sudo chown nobody:nogroup /nfs_share # Often useful for simpler setups
sudo nano /etc/exports #add /nfs_share 192.168.1.200(rw,sync,no_subtree_check)
sudo exportfs -a
sudo exportfs -v
sudo ufw allow from 192.168.1.200 to any port nfs
sudo ufw enable # If firewall is not already enabled
sudo ufw status
sudo systemctl restart nfs-kernel-server
sudo systemctl enable nfs-kernel-server # Ensure it starts on boot

#CENTOS

sudo dnf install nfs-utils
sudo firewall-cmd --permanent --add-service=nfs
sudo firewall-cmd --reload
sudo firewall-cmd --list-services # Verify nfs is listed
sudo mkdir /mnt/ubuntu_share
sudo mount 192.168.1.100:/nfs_share /mnt/ubuntu_share
ls /mnt/ubuntu_share
sudo touch /mnt/ubuntu_share/test_file
ls /mnt/ubuntu_share
sudo umount /mnt/ubuntu_share
sudo nano /etc/fstab #add 192.168.1.100:/nfs_share /mnt/ubuntu_share nfs defaults,_netdev 0 0
sudo mount -a
df -h /mnt/ubuntu_share
findmnt /mnt/ubuntu_share
