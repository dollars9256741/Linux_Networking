## 🛠️ **Lab 1: Enterprise Network Fundamentals**

1.  Topics: Static routing, firewall configuration, and inter-OS connectivity.
   - This lab is a practical implementation of enterprise network architecture fundamentals, utilizing **Rocky Linux** and **Ubuntu Linux**.
   - Topics: Static routing, firewall configuration, and inter-OS connectivity.
2. Environment
   - [VMware Workstation Pro 25H2](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)
   - [Rocky Linux 10-Kickstart Files](https://docs.rockylinux.org/10/guides/automation/kickstart-rocky/)
   - Vargant
3. 🤖 Automation
   - To quickly replicate this environment, I've created a script: `setup_rocky.sh`. It automates:
      - [x] Firewall configuration (HTTP service)
      - [x] Package installation (Apache/httpd)
      - [x] Service status verification
   - Please run the following command first
     `curl -O <filepath> && chmod +x setup_lab1.sh && ./setup_rocky.sh`
4. Notice
   - For Win11 users, please turn off Hyper-V and Related Features by [tutorial](https://community.broadcom.com/vmware-cloud-foundation/discussion/how-to-disable-hyper-v-in-windows-11-24h2#bmd6005bf9-6212-4a5c-8ba9-00493a8e3859).
