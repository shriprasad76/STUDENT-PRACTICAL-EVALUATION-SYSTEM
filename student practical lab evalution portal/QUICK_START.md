## 🚀 QUICK START GUIDE - Student Practical Evaluation System

### ⚡ 5-Minute Setup

Follow these steps to get your system running:

---

## Step 1: Setup MySQL Database

### Option A: Using Command Line
```bash
mysql -u root -p
```
Then paste all content from `backend/db-schema.sql` and press Enter.

### Option B: Using MySQL Workbench
1. Open MySQL Workbench
2. Create new query tab
3. Open `backend/db-schema.sql`
4. Execute the script

### Verify Database Created
```bash
mysql -u root -p student_practical_evaluation -e "SHOW TABLES;"
```

---

## Step 2: Setup Backend Server

### 2.1 Open Terminal/Command Prompt
Navigate to backend folder:
```bash
cd backend
```

### 2.2 Update .env File (if needed)
Edit `backend/.env`:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=<your_mysql_password>
DB_NAME=student_practical_evaluation
PORT=5000
NODE_ENV=development
```

### 2.3 Install Dependencies
```bash
npm install
```

### 2.4 Start Server
```bash
npm start
```

**Expected Output:**
```
✅ MySQL Database connected successfully
🚀 Express Server is running on http://localhost:5000
📚 API Base URL: http://localhost:5000/api
```

✅ **Backend is ready!** Keep this terminal open.

---

## Step 3: Open Frontend in Browser

### Option 1: Direct Open (Simplest)
1. Navigate to `frontend/` folder
2. Right-click on `login.html`
3. Open with → Browser

### Option 2: Local HTTP Server (Recommended)
Open NEW terminal and run:

**Windows:**
```bash
cd frontend
python -m http.server 8000
```

**Mac/Linux:**
```bash
cd frontend
python3 -m http.server 8000
```

Then open browser: `http://localhost:8000/login.html`

---

## Step 4: Login & Test System

### Admin Dashboard
- **URL:** Login with Admin role
- **Username:** `admin`
- **Password:** `admin`
- **Features:** Manage students and teachers

### Teacher Dashboard
- **Email:** `sharma@school.com`
- **Password:** `1234`
- **Features:** Create labs, evaluate students

### Student Dashboard
- **PRN:** `CS001`
- **Password:** `student123` or `CS001`
- **Features:** View labs and marks

---

## ✅ Testing Workflow

### Test Admin Features:
1. Login as Admin
2. Go to "Manage Students"
3. Add a new student (try: PRN=CS006, Name=Test Student, Branch=CS, Year=3, Division=A)
4. View in table
5. Click Edit to modify
6. Click Delete to remove

### Test Teacher Features:
1. Login as Teacher
2. Go to "Create Lab"
3. Fill form:
   - Lab Name: Data Structures Lab
   - Branch: CS
   - Year: 3
   - Division: A
4. Click "Create Lab"
5. You should see success message
6. Go to "My Labs"
7. Click "View Evaluation"
8. Enter marks 0-10 for practicals
9. Check attendance & completion
10. Click "Save All Changes"

### Test Student Features:
1. Login as Student (CS001)
2. Go to "My Labs"
3. Click on a lab
4. View your practicals
5. See completion % and total marks
6. Go to "Summary"
7. See overall performance

---

## 🐛 Troubleshooting

### Backend won't start: "Port 5000 in use"
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Mac/Linux
lsof -i :5000
kill -9 <PID>
```

### Frontend shows "Cannot reach server"
- Ensure backend is running (step 2)
- Check if port 5000 is open
- Open browser console (F12) to see errors

### Database connection error
- Check MySQL is running
- Verify credentials in `.env`
- Run: `mysql -u root -p student_practical_evaluation -e "SELECT 1;"`

### Students not showing after creating lab
- Check browser console for errors
- Ensure students exist in database
- Try refreshing the page

### Can't edit practical marks
- Ensure you're in Teacher dashboard
- Open lab evaluation view
- Modify fields and click "Save All Changes"

---

## 📞 Project Structure Reference

```
📦 Project Root
 ├── 📁 backend/
 │   ├── config/db.js              ← Database config
 │   ├── controllers/               ← Business logic
 │   ├── routes/                    ← API endpoints
 │   ├── server.js                  ← Main server file
 │   ├── package.json               ← Dependencies
 │   ├── .env                       ← Config variables
 │   └── db-schema.sql              ← Database schema
 │
 ├── 📁 frontend/
 │   ├── css/style.css              ← All styling
 │   ├── js/                        ← All JavaScript
 │   ├── login.html                 ← Login page
 │   ├── admin-dashboard.html       ← Admin page
 │   ├── teacher-dashboard.html     ← Teacher page
 │   └── student-dashboard.html     ← Student page
 │
 └── README.md                      ← Full documentation
```

---

## 🎯 Key Features to Try

1. **Auto Student Assignment**
   - Create lab for CS Year 3 Division A
   - All matching students auto-assigned!

2. **Auto Practical Generation**
   - Creating lab auto-generates 12 practicals
   - Auto-creates evaluation status for all students

3. **Marks Calculation**
   - Teacher enters marks 0-10 per practical
   - System calculates total (max 120)
   - Shows percentage and averages

4. **Attendance Tracking**
   - Toggle attendance per practical
   - Auto-counts present classes
   - Shows percentage

5. **Student Summary**
   - View all labs and performance
   - See completion, marks, attendance
   - Visual progress bars

---

## 📝 Sample Test Data

Students in database:
- CS001 - Aarav Kumar
- CS002 - Bhavna Singh
- CS003 - Chirag Verma
- CS004 - Divya Patel
- CS005 - Esha Mishra

Teachers in database:
- Prof. Sharma (sharma@school.com)
- Prof. Patel (patel@school.com)

Admin:
- Username: admin

---

## ✨ System Highlights

✅ **Completely Functional** - All features working
✅ **Responsive Design** - Works on mobile/tablet
✅ **Auto Features** - Lab & practical generation
✅ **Clean UI** - Modern, easy to use
✅ **Database Integrity** - Proper relationships
✅ **Error Handling** - User-friendly messages
✅ **Session Management** - Automatic logouts
✅ **Real-time Updates** - Instant feedback

---

## 🎓 Next Steps

After setup is complete:

1. **Explore Admin Panel**
   - Add more students
   - Add more teachers
   - View statistics

2. **Create Multiple Labs**
   - Different branches/years
   - See automatic assignments

3. **Evaluate as Teacher**
   - Enter marks and attendance
   - Track completion

4. **Review as Student**
   - Check personal performance
   - View all labs

5. **Export/Report** (Optional)
   - Create export functionality
   - Add PDF reports

---

## 💡 Tips

- **Backup Database Before Testing:** `mysqldump -u root -p student_practical_evaluation > backup.sql`
- **Clear Cache:** Ctrl+Shift+Del in browser
- **Check API:** Open `http://localhost:5000/api/health` in browser
- **Keep Terminals Open:** Backend terminal must stay running
- **Use Chrome:** Best compatibility
- **Check Console:** F12 → Console tab for errors

---

## 🚪 Reset Everything

If something breaks, reset:

```bash
# 1. Stop backend (Ctrl+C in terminal)

# 2. Drop and recreate database
mysql -u root -p
DROP DATABASE student_practical_evaluation;
# Then paste db-schema.sql again

# 3. Restart backend
npm start
```

---

## ✅ Success Checklist

- [ ] MySQL database created
- [ ] Backend server running on 5000
- [ ] Frontend loads in browser
- [ ] Can login as Admin
- [ ] Can login as Teacher
- [ ] Can login as Student
- [ ] Can create lab as teacher
- [ ] Can view marks as student
- [ ] Can evaluate as teacher

---

**Congratulations! 🎉 Your Student Practical Evaluation System is ready to use!**

For detailed information, see `README.md` in project root.
