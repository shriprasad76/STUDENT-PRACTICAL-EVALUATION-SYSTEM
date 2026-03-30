#!/bin/bash

# Student Practical Evaluation System - Setup Script for Mac/Linux

echo ""
echo "=================================================="
echo "  Student Practical Evaluation System Setup"
echo "=================================================="
echo ""

# Check Node.js installation
echo "✓ Checking Node.js installation..."
if ! command -v node &> /dev/null; then
    echo "✗ Node.js is not installed!"
    echo ""
    echo "Please download and install Node.js from: https://nodejs.org/"
    exit 1
fi
echo "  Found: $(node --version)"

# Check MySQL installation
echo "✓ Checking MySQL installation..."
if ! command -v mysql &> /dev/null; then
    echo "✗ MySQL is not installed!"
    echo ""
    echo "Please install MySQL:"
    echo "  Mac: brew install mysql"
    echo "  Linux: sudo apt-get install mysql-server"
    exit 1
fi
echo "  Found: $(mysql --version)"

echo ""
echo "=================================================="
echo "Step 1: Installing Backend Dependencies"
echo "=================================================="
cd backend
echo "✓ Running npm install..."
npm install

if [ $? -ne 0 ]; then
    echo "✗ Failed to install dependencies!"
    exit 1
fi

echo ""
echo "=================================================="
echo "Step 2: Database Setup"
echo "=================================================="
echo ""
echo "Please enter your MySQL credentials:"
read -p "MySQL Username (default: root): " DB_USER
DB_USER=${DB_USER:-root}

read -sp "MySQL Password (press Enter if no password): " DB_PASSWORD
echo ""

echo ""
echo "✓ Creating database..."

if [ -z "$DB_PASSWORD" ]; then
    mysql -u "$DB_USER" < db-schema.sql
else
    mysql -u "$DB_USER" -p"$DB_PASSWORD" < db-schema.sql
fi

if [ $? -ne 0 ]; then
    echo "✗ Database creation failed!"
    echo ""
    echo "Please check your MySQL credentials and try again."
    exit 1
fi

echo "✓ Database created successfully!"

echo ""
echo "=================================================="
echo "Step 3: Updating .env file"
echo "=================================================="
echo ""
echo "Updating .env with your credentials..."

cat > .env << EOF
DB_HOST=localhost
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_NAME=student_practical_evaluation
PORT=5000
NODE_ENV=development
EOF

echo "✓ .env file created!"

echo ""
echo "=================================================="
echo "Setup Complete!"
echo "=================================================="
echo ""
echo "Your Student Practical Evaluation System is ready!"
echo ""
echo "To start the application:"
echo ""
echo "1. Start Backend Server (keep this terminal open):"
echo "   cd backend"
echo "   npm start"
echo ""
echo "2. Open Frontend in Browser:"
echo "   Open: frontend/login.html"
echo "   or use: python3 -m http.server 8000"
echo ""
echo "3. Login Credentials:"
echo "   Admin: admin / admin"
echo "   Teacher: sharma@school.com / 1234"
echo "   Student: CS001 / student123"
echo ""
echo "For more details, see QUICK_START.md and README.md"
echo ""
