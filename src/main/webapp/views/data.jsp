<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management | Premium</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4895ef;
            --primary-dark: #3a0ca3;
            --secondary: #f72585;
            --accent: #4cc9f0;
            --dark: #14213d;
            --light: #f8f9fa;
            --success: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
            --gray: #95a5a6;
            --card-bg: rgba(255, 255, 255, 0.85);
            --glass-border: rgba(255, 255, 255, 0.2);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: var(--dark);
            overflow-x: hidden;
        }
        
        .blob {
            position: fixed;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            filter: blur(60px);
            opacity: 0.3;
            z-index: -1;
        }
        
        .blob-1 {
            background: var(--primary-light);
            top: -100px;
            left: -100px;
            animation: float 15s infinite alternate;
        }
        
        .blob-2 {
            background: var(--secondary);
            bottom: -150px;
            right: -100px;
            animation: float 18s infinite alternate-reverse;
        }
        
        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(50px, 80px) rotate(30deg); }
            100% { transform: translate(-30px, -50px) rotate(-20deg); }
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3rem;
            padding: 1.5rem;
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
            border: 1px solid var(--glass-border);
            animation: fadeIn 0.8s ease-out;
        }
        
        h1 {
            font-weight: 700;
            font-size: 2.5rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: -0.5px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.8rem 1.8rem;
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: none;
            cursor: pointer;
            font-size: 1rem;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(67, 97, 238, 0.4);
        }
        
        .btn:active {
            transform: translateY(1px);
        }
        
        .btn::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, var(--primary-light), var(--primary));
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .btn:hover::after {
            opacity: 1;
        }
        
        .btn i {
            margin-right: 0.6rem;
            font-size: 1.1rem;
        }
        
        .main-content {
            animation: slideUp 0.8s ease-out;
        }
        
        .card {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
            border: 1px solid var(--glass-border);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        thead {
            background: linear-gradient(to right, var(--primary), var(--primary-dark));
            color: white;
        }
        
        th {
            padding: 1.2rem 1.5rem;
            text-align: left;
            font-weight: 600;
            letter-spacing: 0.5px;
            position: relative;
        }
        
        th:not(:last-child)::after {
            content: '';
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            height: 60%;
            width: 1px;
            background: rgba(255, 255, 255, 0.2);
        }
        
        td {
            padding: 1.2rem 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tbody tr {
            transition: all 0.3s ease;
        }
        
        tbody tr:hover {
            transform: translateX(5px);
            background: rgba(67, 97, 238, 0.05);
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.8rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: capitalize;
            letter-spacing: 0.5px;
        }
        
        .badge-male {
            background: rgba(67, 97, 238, 0.1);
            color: var(--primary-dark);
            border: 1px solid var(--primary);
        }
        
        .badge-female {
            background: rgba(247, 37, 133, 0.1);
            color: var(--secondary);
            border: 1px solid var(--secondary);
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--gray);
        }
        
        .empty-icon {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            color: #e0e0e0;
            animation: pulse 2s infinite;
        }
        
        .empty-state h3 {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark);
            font-size: 1.5rem;
        }
        
        .empty-state p {
            max-width: 500px;
            margin: 0 auto 1.5rem;
            line-height: 1.6;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        /* Floating action button */
        .fab {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            width: 60px;
            height: 60px;
            background: linear-gradient(45deg, var(--secondary), #f7478f);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 6px 20px rgba(247, 37, 133, 0.3);
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 100;
            animation: bounce 2s infinite;
        }
        
        .fab:hover {
            transform: scale(1.1) translateY(-5px);
            box-shadow: 0 8px 25px rgba(247, 37, 133, 0.4);
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        /* Responsive */
        @media (max-width: 992px) {
            header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1.5rem;
            }
            
            .btn {
                width: 100%;
            }
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .card {
                border-radius: 12px;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <!-- Background blobs -->
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    
    <div class="container">
        <header>
            <h1>Student Dashboard</h1>
            <a href="/" class="btn">
                <i class="fas fa-plus-circle"></i> Add New Student
            </a>
        </header>
        
        <div class="main-content">
            <div class="card">
                <c:choose>
                    <c:when test="${not empty students}">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Student Name</th>
                                    <th>Email Address</th>
                                    <th>Gender</th>
                                    <th>Course</th>
                                    <th>Schedule</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${students}" var="student" varStatus="index">
                                    <tr>
                                        <td>${index.count}</td>
                                        <td>
                                            <strong>${student.name}</strong>
                                        </td>
                                        <td>${student.email}</td>
                                        <td>
                                            <span class="status-badge ${student.gender eq 'Male' ? 'badge-male' : 'badge-female'}">
                                                <i class="fas ${student.gender eq 'Male' ? 'fa-mars' : 'fa-venus'}"></i> ${student.gender}
                                            </span>
                                        </td>
                                        <td>${student.course}</td>
                                        <td>
                                            <i class="fas fa-clock" style="color: var(--primary-light); margin-right: 0.5rem;"></i>
                                            ${student.timing}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <div class="empty-icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <h3>No Students Found</h3>
                            <p>It looks like you haven't added any students yet. Get started by adding your first student record.</p>
                            <a href="/" class="btn" style="margin-top: 1rem;">
                                <i class="fas fa-plus-circle"></i> Add First Student
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    <!-- Floating Action Button -->
    <a href="/" class="fab">
        <i class="fas fa-plus"></i>
    </a>
</body>
</html>