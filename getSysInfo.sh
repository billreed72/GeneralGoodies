echo '[OS INFORMATION]' > system_info.txt && \
cat /proc/version >> system_info.txt && \
uname -a >> system_info.txt && \
lsb_release -a >> system_info.txt && \
cat /etc/*release* >> system_info.txt && \
echo '[CPU INFORMATION]' >> system_info.txt && \
cat /proc/cpuinfo >> system_info.txt && \
lscpu >> system_info.txt && \
echo '[MEMORY INFORMATION]' >> system_info.txt && \
cat /proc/meminfo >> system_info.txt && \
free -mt >> system_info.txt && \
echo '[NETWORK INFORMATION]' >> system_info.txt && \
ifconfig >> system_info.txt && \
cat /etc/hosts >> system_info.txt && \
cat /etc/hostname >> system_info.txt && \
echo '[PCI INFORMATION]' >> system_info.txt && \
lspci >> system_info.txt && \
echo '[STORAGE INFORMATION]' >> system_info.txt && \
lsblk >> system_info.txt && \
df -h >> system_info.txt && \
fdisk -l >> system_info.txt && \
mount >> system_info.txt && \
cat /proc/partitions >> system_info.txt && \
echo '[BIOS INFORMATION]' >> system_info.txt && \
dmidecode >> system_info.txt && \
echo '[FIREWALL INFORMATION]' >> system_info.txt && \
netstat -tulpn >> system_info.txt && \
echo '[HARDWARE INFORMATION]' >> system_info.txt && \
lshw >> system_info.txt
