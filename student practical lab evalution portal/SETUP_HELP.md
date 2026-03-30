# 🔧 Setup Troubleshooting Guide

## Current Issue: MySQL Connection Error

Your Express server is running, but can't connect to MySQL database.

---

## ✅ Step-by-Step Fix

### Step 1: Verify MySQL is Running

**On Windows:**
1. Open Services (services.msc)
2. Look for "MySQL80" or "MySQL Server"
3. If stopped, right-click → Start
4. Or search "MySQL Command Line Client" and try to open it

**Check MySQL status:**
```bash
mysql --version
```

If MySQL is not in PATH, you need to add it.

---

### Step 2: Identify Your MySQL Password

Try these common scenarios:

**Scenario A: No Password (Default during installation)**
```bash
mysql -u root
```

**Scenario B: Password is "root"**
```bash
mysql -u root -p
# Then type: root
```

**Scenario C: Password is "password" or "123"**
```bash
mysql -u root -p
# Then type your password
```

---

### Step 3: Create Database

Once you find your password, run:

**With NO password:**
```bash
cd backend
mysql -u root < db-schema.sql
```

**With password:**
```bash
cd backend
mysql -u root -p < db-schema.sql
# Then type your password when prompted
```

Or use MySQL GUI (MySQL Workbench):
1. Open MySQL Workbench
2. Create New Query Tab
3. Open File → backend/db-schema.sql
4. Execute

---

### Step 4: Update .env File

Edit `backend/.env`:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_actual_password_here
DB_NAME=student_practical_evaluation
PORT=5000
NODE_ENV=development
```

**Examples:**
- No password: `DB_PASSWORD=`
- Password "root": `DB_PASSWORD=root`
- Password "mypass123": `DB_PASSWORD=mypass123`

---

### Step 5: Start Server

```bash
cd backend
npm start
```

**Success Message Should Show:**
```
✅ MySQL Database connected successfully
🚀 Express Server is running on http://localhost:5000
```

---

## 🆘 If Still Not Working

### Check MySQL is installed:
```bash
mysql --version
```
If not found, [Download MySQL](https://dev.mysql.com/downloads/mysql/)

### Check MySQL is running:
- Windows: Open Services → look for MySQL80
- Keep it running while using the app

### Get your exact password:
If you've forgotten your MySQL password, you can reset it:

**Windows Reset:**
1. Stop MySQL service
2. Open CMD as Administrator
3. Go to MySQL bin directory: `cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"`
4. Run: `mysqld --skip-grant-tables`
5. In another CMD: `mysql -u root`
6. Reset password:
```sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
```

---

## 📋 Checklist

- [ ] MySQL server is installed and running
- [ ] Found your MySQL root password
- [ ] Database `student_practical_evaluation` created (from db-schema.sql)
- [ ] `.env` file has correct password
- [ ] Server runs without database connection error
- [ ] Can see "✅ MySQL Database connected successfully"

---

## 🎯 Next Steps After Setup

1. Server should show:
   ```
   ✅ MySQL Database connected successfully
   🚀 Express Server is running on http://localhost:5000
   ```

2. Then open frontend:
   ```
   http://localhost/frontend/login.html
   or
   Open frontend/login.html directly in browser
   ```

3. Login with demo credentials:
   - Admin: admin / admin
   - Teacher: sharma@school.com / 1234
   - Student: CS001 / student123

---

## 💡 Tips

- **Keep backend terminal open** - Server keeps running
- **Don't use Ctrl+C** unless you want to stop it
- **For development**: Keep both MySQL and Node running
- **For testing**: Backend on port 5000, Frontend opens in browser

---

Still having issues? Check:
1. Is MySQL actually running? (Services or Task Manager)
2. Is your password correct in .env?
3. Is database created? (Run db-schema.sql)
4. Is port 5000 available? (No other app using it)

