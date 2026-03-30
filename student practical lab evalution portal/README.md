# 📚 Student Practical Evaluation System

A full-stack web application for managing student practical evaluations with role-based access (Admin, Teacher, Student).

## 🎯 Features

### Admin Panel
- ✅ Manage students (Add, Edit, Delete)
- ✅ Manage teachers (Add, Edit, Delete)
- ✅ View system overview and statistics

### Teacher Dashboard
- ✅ Create labs for specific classes
- ✅ Automatic student assignment based on Branch, Year, Division
- ✅ Auto-generate 12 practicals per lab
- ✅ Evaluate students with marks (0-10) and attendance
- ✅ Track practical completion status

### Student Portal
- ✅ View assigned labs
- ✅ Check practical completion status
- ✅ View marks and attendance
- ✅ View overall performance summary

## 📋 Tech Stack

**Frontend:**
- HTML5
- CSS3 (Flexbox/Grid)
- Vanilla JavaScript (No frameworks)

**Backend:**
- Node.js with Express.js
- MySQL Database
- RESTful APIs

**Database:**
- MySQL with InnoDB engine

## 📁 Project Structure

```
student-practical-evaluation-system/
├── backend/
│   ├── config/
│   │   └── db.js
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── adminController.js
│   │   ├── teacherController.js
│   │   └── studentController.js
│   ├── routes/
│   │   ├── authRoutes.js
│   │   ├── adminRoutes.js
│   │   ├── teacherRoutes.js
│   │   └── studentRoutes.js
│   ├── db-schema.sql
│   ├── server.js
│   ├── package.json
│   └── .env
├── frontend/
│   ├── css/
│   │   └── style.css
│   ├── js/
│   │   ├── auth.js
│   │   ├── admin.js
│   │   ├── teacher.js
│   │   └── student.js
│   ├── login.html
│   ├── admin-dashboard.html
│   ├── teacher-dashboard.html
│   └── student-dashboard.html
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

### Backend Setup

1. **Navigate to backend directory:**
   ```bash
   cd backend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Create MySQL Database:**
   ```bash
   mysql -u root -p < db-schema.sql
   ```
   Or manually:
   ```sql
   -- Run the SQL commands from db-schema.sql in your MySQL client
   ```

4. **Configure .env file:**
   ```
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=your_password
   DB_NAME=student_practical_evaluation
   PORT=5000
   NODE_ENV=development
   ```

5. **Start the server:**
   ```bash
   npm start
   ```
   
   Or with auto-reload (requires nodemon):
   ```bash
   npm run dev
   ```

   Server will run on: `http://localhost:5000`

### Frontend Setup

1. **Open in browser:**
   - Open `frontend/login.html` in your web browser
   - Or serve using a local web server:
   ```bash
   # Using Python 3
   cd frontend
   python -m http.server 8000
   ```
   - Open `http://localhost:8000/login.html`

## 🔐 Demo Credentials

### Admin Account
```
Username: admin
Password: admin
```

### Teacher Account
```
Email: sharma@school.com
Password: 1234
```

### Student Account
```
PRN: CS001
Password: student123 (or CS001)
```

## 📊 Database Schema

### Tables

1. **students** - Student information
   - student_id, prn, full_name, branch, year, division

2. **teachers** - Teacher information
   - teacher_id, name, email, password

3. **admin** - Admin accounts
   - admin_id, username, password

4. **labs** - Practical labs
   - lab_id, lab_name, teacher_id, branch, year, division, total_practicals

5. **student_labs** - Student to Lab mapping
   - student_lab_id, student_id, lab_id

6. **practicals** - Individual practicals
   - practical_id, lab_id, practical_no

7. **student_practical_status** - Student practical evaluation
   - status_id, student_id, practical_id, completed, marks, attendance

## 🔌 API Endpoints

### Authentication
- `POST /api/auth/admin-login` - Admin login
- `POST /api/auth/teacher-login` - Teacher login
- `POST /api/auth/student-login` - Student login

### Admin Routes
- `GET /api/admin/students` - Get all students
- `POST /api/admin/students/add` - Add new student
- `PUT /api/admin/students/update` - Update student
- `DELETE /api/admin/students/delete` - Delete student
- `GET /api/admin/teachers` - Get all teachers
- `POST /api/admin/teachers/add` - Add new teacher
- `PUT /api/admin/teachers/update` - Update teacher
- `DELETE /api/admin/teachers/delete` - Delete teacher

### Teacher Routes
- `GET /api/teacher/labs/:teacher_id` - Get teacher's labs
- `POST /api/teacher/labs/create` - Create new lab
- `GET /api/teacher/labs/students/:lab_id` - Get lab students
- `GET /api/teacher/labs/summary/:lab_id` - Get lab summary
- `PUT /api/teacher/practicals/update-status` - Update practical status

### Student Routes
- `GET /api/student/labs/:student_id` - Get assigned labs
- `GET /api/student/practicals/:student_id/:lab_id` - Get practicals for lab
- `GET /api/student/summary/:student_id` - Get performance summary

## 🎨 UI Features

### Responsive Design
- Mobile-friendly layout
- Flexbox & CSS Grid based design
- Works on all screen sizes

### Color Scheme
- Primary: Green (#4CAF50)
- Secondary: Blue (#2196F3)
- Danger: Red (#f44336)
- Background: Light gray (#f5f5f5)

### Components
- Sidebar navigation
- Data tables with sorting
- Forms with validation
- Alert notifications
- Modal dialogs
- Progress indicators
- Stat cards

## ⚙️ Configuration

### Change Database Connection
Edit `backend/.env`:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=student_practical_evaluation
PORT=5000
```

### Change API Port
Edit `backend/.env`:
```
PORT=5000  # Change this
```

Then update frontend API_BASE in JS files to match.

## 🐛 Troubleshooting

### Database Connection Error
```
Error: connect ECONNREFUSED 127.0.0.1:3306
```
**Solution:** 
- Ensure MySQL is running
- Check database credentials in `.env`
- Verify database name exists

### CORS Error
```
Access to XMLHttpRequest blocked by CORS policy
```
**Solution:**
- Ensure backend server is running
- Check API_BASE URL in frontend JS files
- Verify CORS is enabled in Express (already configured)

### Port Already in Use
```
Error: listen EADDRINUSE: address already in use :::5000
```
**Solution:**
```bash
# Kill process on port 5000
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Linux/Mac
lsof -i :5000
kill -9 <PID>
```

## 📝 Usage Workflow

### Admin Workflow
1. Login with admin credentials
2. Manage Students:
   - Add new students (provide PRN, Name, Branch, Year, Division)
   - Edit or delete existing students
3. Manage Teachers:
   - Add new teachers (provide Name, Email, Password)
   - Edit or delete teachers
4. View overview statistics

### Teacher Workflow
1. Login with email and password
2. Create new lab:
   - Enter lab name
   - Select Branch, Year, Division
   - Confirm to auto-assign students and create practicals
3. View labs and students
4. Evaluate students:
   - Mark practicals as complete/incomplete
   - Enter marks (0-10) for each practical
   - Mark attendance (Present/Absent)
   - Save changes

### Student Workflow
1. Login with PRN and password
2. View assigned labs
3. Click on lab to see practicals
4. View practical details:
   - Completion status
   - Marks obtained
   - Attendance
5. View overall summary:
   - Performance across all labs
   - Progress charts
   - Statistics

## 🔄 Auto-Generation Features

### When Lab is Created
✅ 12 practicals are automatically created
✅ All matching students are automatically assigned
✅ Student practical status records are auto-created
✅ Ready for teacher evaluation

## 📊 Evaluation System

### Marks System
- Each practical: 0-10 marks
- Total per student: Up to 120 marks (12 practicals × 10)
- Progressive marks tracking

### Attendance Tracking
- Per practical attendance (Present/Absent)
- Total attendance counter
- Attendance percentage calculation

### Completion Status
- Binary completion flag for each practical
- Completion percentage per student
- Visual progress indicators

## 🎓 Student Performance Metrics

- **Completed Practicals**: Number of completed practicals
- **Total Marks**: Sum of marks across all practicals
- **Attendance Rate**: Percentage of classes attended
- **Lab-wise Performance**: Detailed stats per lab

## 🌐 Responsive Breakpoints

- Desktop: 1200px+
- Tablet: 768px - 1199px
- Mobile: Below 768px

## 📱 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge
- Mobile browsers (iOS Safari, Chrome Android)

## 🔒 Security Notes

**⚠️ Important:** 
- This is a demo application
- Passwords are stored as plain text (NOT RECOMMENDED for production)
- For production, use bcrypt for password hashing
- Implement proper authentication (JWT tokens)
- Add input validation and sanitization
- Use HTTPS instead of HTTP
- Implement rate limiting
- Add proper error handling

## 🚀 Production Deployment

1. **Use bcrypt for password hashing:**
   ```bash
   npm install bcryptjs
   ```

2. **Implement JWT authentication**

3. **Use environment variables for sensitive data**

4. **Enable HTTPS/SSL**

5. **Add database backups**

6. **Implement logging system**

7. **Add input validation middleware**

## 📞 Support & Issues

For issues or questions:
1. Check the console for error messages
2. Verify all services are running (Node, MySQL)
3. Check network tab in browser DevTools
4. Ensure correct credentials are used
5. Clear browser cache/cookies

## 📄 License

This project is provided as-is for educational purposes.

## 👨‍💻 Developer

Created as a complete full-stack solution for student practical evaluation system.

---

**Last Updated:** March 2026
**Version:** 1.0.0
