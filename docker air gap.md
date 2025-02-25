Running a **MySQL Docker image** on an **air-gapped Ubuntu server** (without internet access) requires a manual approach to transferring and loading the Docker image. Here's a step-by-step guide:

---

### **1. Download the MySQL Docker Image on an Internet-Connected Machine**
On a machine with internet access, pull the MySQL image from Docker Hub:
```bash
docker pull mysql:latest
```
Verify the downloaded image:
```bash
docker images | grep mysql
```
Save the image as a tar file:
```bash
docker save -o mysql-latest.tar mysql:latest
```
Now, transfer the `mysql-latest.tar` file to your air-gapped Ubuntu server using **USB, SCP, or any offline method**.

---

### **2. Load the Docker Image on the Air-Gapped Ubuntu Server**
On the **air-gapped server**, place the `mysql-latest.tar` file in a directory and load it into Docker:
```bash
docker load -i mysql-latest.tar
```
Verify that the image is available:
```bash
docker images
```

---

### **3. Run the MySQL Container**
Now, you can run the MySQL container:
```bash
docker run -d \
  --name mysql-server \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -p 3306:3306 \
  --restart unless-stopped \
  mysql:latest
```
- `-e MYSQL_ROOT_PASSWORD=my-secret-pw` → Set root password.
- `-p 3306:3306` → Expose MySQL on port 3306.
- `--restart unless-stopped` → Ensures the container restarts on reboot.

Check if the container is running:
```bash
docker ps
```

---

### **4. Verify MySQL is Running**
To enter the container:
```bash
docker exec -it mysql-server mysql -u root -p
```
Enter the password (`my-secret-pw`), and you should have access to MySQL.

---

### **Optional: Persist MySQL Data**
If you need to **persist data** between container restarts, use a volume:
```bash
docker run -d \
  --name mysql-server \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -p 3306:3306 \
  -v /data/mysql:/var/lib/mysql \
  --restart unless-stopped \
  mysql:latest
```
This ensures that MySQL data is stored in `/data/mysql` on the host.

---

### **Summary**
1. **Download & save** MySQL image on an online machine (`docker save`).
2. **Transfer** the image to the air-gapped Ubuntu server.
3. **Load** the image (`docker load`).
4. **Run** the container with MySQL.
5. **Verify** and manage MySQL as needed.

Let me know if you need help with any specific step! 🚀
