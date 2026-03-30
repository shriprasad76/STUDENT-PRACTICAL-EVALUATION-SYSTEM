# 🚀 How to Run Backend + Frontend Together

## Option 1: Using Two Terminals (Recommended for Development)

### **Terminal 1: Start Backend Server**

```bash
cd backend
npm start
```

**Expected output:**
```
✅ MySQL Database connected successfully
🚀 Express Server is running on http://localhost:5000
📚 API Base URL: http://localhost:5000/api
```

✅ **Keep this terminal open** - your server will continue running

---

### **Terminal 2: Open Frontend**

Once backend is running, open a **NEW terminal window** and do one of these:

#### **Option A: Using Python HTTP Server (Recommended)**
```bash
cd frontend
python -m http.server 8000
```

Then open browser: **http://localhost:8000/login.html**

#### **Option B: Using Node HTTP Server**
```bash
npm install -g http-server
cd frontend
http-server -p 8000
```

Then open browser: **http://localhost:8000/login.html**

#### **Option C: Direct Browser Open**
```bash
cd frontend
# Then double-click login.html or right-click → Open with Browser
```

---

## Option 2: Using Single Terminal with Background Process (Advanced)

### **Windows Command Prompt Only:**

```bash
cd backend && start npm start && cd ..\frontend && python -m http.server 8000
```

**Then open browser:** http://localhost:8000/login.html

---

## Option 3: Using Batch Script (Windows)

Create a file named `start-app.bat` in your project root:

```batch
@echo off
echo Starting Student Practical Evaluation System...
echo.
echo Starting Backend Server (Port 5000)...
start cmd /k "cd backend && npm start"
echo.
timeout /t 3
echo Starting Frontend Server (Port 8000)...
start cmd /k "cd frontend && python -m http.server 8000"
echo.
echo Applications starting...
echo Backend: http://localhost:5000/api
echo Frontend: http://localhost:8000/login.html
timeout /t 2
echo Opening login page...
start http://localhost:8000/login.html
```

**Usage:**
1. Save the code above as `start-app.bat` in project root
2. Double-click `start-app.bat`
3. Browser opens automatically!

---

## Option 4: Using Bash Script (Mac/Linux)

Create a file named `start-app.sh` in your project root:

```bash
#!/bin/bash

echo "🚀 Starting Student Practical Evaluation System..."
echo ""

echo "Starting Backend Server (Port 5000)..."
cd backend
npm start &
BACKEND_PID=$!

echo "Waiting for backend to start..."
sleep 3

echo "Starting Frontend Server (Port 8000)..."
cd ../frontend
python3 -m http.server 8000 &
FRONTEND_PID=$!

echo ""
echo "✅ Applications started!"
echo "Backend: http://localhost:5000/api"
echo "Frontend: http://localhost:8000/login.html"
echo ""

# Open browser (on Mac or Linux with xdg-open)
if [[ "$OSTYPE" == "darwin"* ]]; then
    open http://localhost:8000/login.html
elif [[ "$OSTYPE" == "linux"* ]]; then
    xdg-open http://localhost:8000/login.html
fi

# Keep script running
wait
```

**Usage:**
```bash
chmod +x start-app.sh
./start-app.sh
```

---

## 📋 Checklist Before Starting

- ✅ MySQL is running (check Services on Windows)
- ✅ `.env` file has correct MySQL password
- ✅ Database created from db-schema.sql
- ✅ Node.js is installed (`node --version`)
- ✅ npm installed (`npm --version`)
- ✅ Python installed (for HTTP server)

---

## 🌐 Access Points

Once both are running:

| Service | URL | Notes |
|---------|-----|-------|
| **API** | http://localhost:5000/api | Backend API |
| **Frontend** | http://localhost:8000/login.html | Login page |
| **Health Check** | http://localhost:5000/api/health | API status |

---

## 🎯 New Teacher Sign-Up Flow

1. Go to **http://localhost:8000/login.html**
2. Click **✍️ Sign Up** tab
3. Fill in:
   - Full Name
   - Email
   - Password (min 6 characters)
   - Confirm Password
4. Click **Sign Up as Teacher**
5. On success, automatically switched to Login tab
6. Login with your new credentials
7. Access Teacher Dashboard ✅

---

## 🔄 Workflow When Developing

1. **Keep backend terminal open** - it logs API calls
2. **Keep frontend terminal open** - it shows HTTP server logs
3. **Edit frontend code** - changes auto-reflect in browser (refresh page)
4. **Edit backend code** - restart server: Stop (Ctrl+C) → `npm start`
5. **Check browser console** (F12) for errors
6. **Check backend terminal** for server errors

---

## ❌ Troubleshooting

### **Port 5000 already in use**
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Mac/Linux
lsof -i :5000
kill -9 <PID>
```

### **Port 8000 already in use**
```bash
# Use different port
cd frontend
python -m http.server 9000
# Then open: http://localhost:9000/login.html
```

### **Backend not connecting to database**
- Check MySQL is running
- Check `.env` password is correct
- Verify database exists: mysql command line

### **Frontend can't reach backend**
- Ensure backend is running on 5000
- Check browser console (F12) for CORS errors
- Try: http://localhost:5000/api/health

### **Changes not reflecting in browser**
- Hard refresh: Ctrl+Shift+R (Chrome) or Cmd+Shift+R (Mac)
- Clear cache: Ctrl+Shift+Delete
- Restart backend if you changed server code

---

## 💡 Quick Tips

- **Keep both terminals visible** - helpful for debugging
- **Pin both windows** - easier to switch between them
- **Use VS Code terminal** - can have both running in same window
- **Watch backend logs** - shows all API requests
- **Use browser DevTools** (F12) - shows all fetch requests

---

## 🎉 You're All Set!

Now you have:
- ✅ Backend running on port 5000
- ✅ Frontend running on port 8000
- ✅ Teachers can sign up! 
- ✅ Full system ready to use

**Happy coding!** 🚀

---

## Next Features You Can Add

After successful setup:
- [ ] Add email verification for new teachers
- [ ] Add password reset functionality
- [ ] Add teacher profile page
- [ ] Add student password verification
- [ ] Add data export to PDF/Excel
