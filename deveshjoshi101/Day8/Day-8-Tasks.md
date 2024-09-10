### Day 8: Linux File System and Structure

#### **Task 1: Understand the Linux Directory Structure**

**Objective:** Learn the hierarchy and purpose of different directories in the Linux filesystem.

**Key Directories:**

- **`/`:** The root directory, the top-level directory of the filesystem.
- **`/bin`:** Essential command binaries (e.g., `ls`, `cp`).
- **`/boot`:** Bootloader files, including the kernel.
- **`/dev`:** Device files representing hardware components (e.g., `/dev/sda`).
- **`/etc`:** System configuration files.
- **`/home`:** User home directories.
- **`/lib`:** Essential shared libraries for binaries in `/bin` and `/sbin`.
- **`/mnt`:** Temporary mount points for filesystems.
- **`/opt`:** Optional software packages.
- **`/proc`:** Virtual filesystem providing process and system information.
- **`/root`:** Home directory for the root user.
- **`/sbin`:** System binaries, primarily for root user.
- **`/tmp`:** Temporary files.
- **`/usr`:** Secondary hierarchy for user data; contains binaries, libraries, and documentation.
- **`/var`:** Variable files like logs, databases, and spool files.

**Outcome:** Familiarity with the purpose and typical content of each directory in the Linux filesystem, critical for system navigation and management.

---

#### **Task 2: Learn About Mounting and Unmounting File Systems**

**Objective:** Understand how to mount and unmount filesystems in Linux, which is essential for accessing different storage devices.

**Mounting a Filesystem:**

```bash
sudo mount /dev/sdX1 /mnt
```

- **`/dev/sdX1`:** Replace with the appropriate device identifier.
- **`/mnt`:** The directory where the filesystem will be mounted.

**Unmounting a Filesystem:**

```bash
sudo umount /mnt
```

- Ensures safe removal of the storage device.

**Outcome:** Ability to mount and unmount filesystems, allowing access to external drives, partitions, and network shares.

---

#### **Task 3: Explore and Practice with `df`, `du`, and `fdisk` Commands**

**Objective:** Gain proficiency in disk management and usage analysis tools.

1. **`df`:** Displays disk space usage.
   ```bash
   df -h
   ```
   - **`-h`:** Human-readable format, showing sizes in KB, MB, GB, etc.
2. **`du`:** Estimates file and directory space usage.
   ```bash
   du -sh /path/to/directory
   ```
   - **`-s`:** Summary of total space used.
   - **`-h`:** Human-readable format.
3. **`fdisk`:** Partition table manipulator.
   ```bash
   sudo fdisk -l
   ```
   - Lists all partitions on the system.

**Outcome:** Ability to monitor disk usage and manage partitions, crucial for maintaining system health and performance.

---

#### **Task 4: Create and Manage Partitions Using `parted` or `gparted`**

**Objective:** Learn to create, resize, and manage partitions using partitioning tools.

**Using `parted`:**

1. Start `parted` on a specific device:
   ```bash
   sudo parted /dev/sdX
   ```
2. Create a new partition:
   ```bash
   mkpart primary ext4 1MiB 100%
   ```
   - Creates a primary partition with an ext4 filesystem.

**Using `gparted`:**

- **GParted** is a graphical tool with a user-friendly interface for managing partitions.
- Perform operations like creating, resizing, deleting, and moving partitions visually.

**Outcome:** Competence in creating and managing disk partitions, enabling efficient use of disk space and preparation for system installation or multi-boot setups.

---

#### **Task 5: Learn About File System Permissions and Ownership**

**Objective:** Understand and practice setting file permissions and ownership in Linux.

**File Permissions:**

- Permissions are displayed as `rwx` for the owner, group, and others.
- Use `chmod` to change permissions.
  ```bash
  chmod 755 filename
  ```
  - **`7`**: Owner has read, write, execute.
  - **`5`**: Group and others have read and execute.

**File Ownership:**

- Change file ownership with `chown`.
  ```bash
  sudo chown user:group filename
  ```
  - Changes the owner and group of the file.

**Outcome:** Mastery of file permissions and ownership, ensuring proper security and access control in a multi-user environment.

---
