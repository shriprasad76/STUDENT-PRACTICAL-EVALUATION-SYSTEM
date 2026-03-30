# ⚡ Quick Start Commands

## Your Configuration
```
Database: student_practical_evaluation
MySQL User: root
MySQL Password: manager
Backend Port: 5000
Frontend Port: 8000
```

---

## 🚀 Fast Setup (Copy & Paste)

### **Step 1: First Time Only - Install Dependencies**
```bash
cd backend
npm install
```

---

### **Step 2A: Start Backend (Terminal 1)**
```bash
cd backend
npm start
```

**Wait for:**
```
✅ MySQL Database connected successfully
🚀 Express Server is running on http://localhost:5000
```

---

### **Step 2B: Start Frontend (Terminal 2 - NEW)**
```bash
cd frontend
python -m http.server 8000
```

**You should see:**
```
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

---

## 🌐 Open in Browser

**URL:** http://localhost:8000/login.html

---

## 🎓 Test Sign-Up Features

### **New Teacher Sign-Up**
1. Click **✍️ Sign Up** tab
2. Fill in:
   - Name: Your Name
   - Email: yourname@school.com
   - Password: password123
   - Confirm: password123
3. Click **Sign Up as Teacher**
4. Success! ✅

### **Login with New Account**
1. Click **🔐 Login** tab
2. Select **Teacher** role
3. Enter email & password
4. Access teacher dashboard

### **Existing Demo Accounts**
- Admin: `admin` / `admin`
- Teacher: `sharma@school.com` / `1234`
- Student: `CS001` / `student123`

---

## 📝 What's New?

✅ **Teacher Sign-Up Feature**
- Teachers can create their own account
- Validation for email & password
- Email must be unique
- Password must be 6+ characters

✅ **Login/Sign-Up Toggle**
- Easy switch between login and sign-up
- Clean, modern UI
- Role-specific forms

---

## 🛑 Stop Services

**Backend:** Press `Ctrl+C` in backend terminal

**Frontend:** Press `Ctrl+C` in frontend terminal

---

## 🔄 Restart After Code Changes

**Backend Changes:**
```bash
# In backend terminal
Ctrl+C
npm start
```

**Frontend Changes:**
```bash
# Just refresh browser (F5 or Ctrl+R)
# Or Ctrl+Shift+R for hard refresh
```

---

## ✅ Verification Checklist

- [ ] Backend running on http://localhost:5000
- [ ] Frontend running on http://localhost:8000
- [ ] Can access login page
- [ ] Can toggle between Login & Sign Up
- [ ] Can create new teacher account
- [ ] Can login with existing accounts
- [ ] Teacher dashboard loads correctly
- [ ] Student dashboard loads correctly

---

**All set! Your system is ready to use.** 🎉
