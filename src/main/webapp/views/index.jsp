<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6e48aa;
            --secondary: #9d50bb;
            --accent: #4776E6;
            --dark: #1a1a2e;
            --light: #f8f9fa;
            --success: #4BB543;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            color: var(--light);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 100%;
            max-width: 800px;
            padding: 40px;
            animation: fadeIn 0.8s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        h2 {
            font-family: 'Orbitron', sans-serif;
            text-align: center;
            margin-bottom: 30px;
            color: white;
            font-size: 2.2rem;
            text-shadow: 0 0 10px rgba(110, 72, 170, 0.7);
            letter-spacing: 1px;
        }
        
        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        
        .form-table td {
            padding: 10px;
        }
        
        .form-table tr:last-child td {
            border-bottom: none;
        }
        
        .form-label {
            font-weight: 500;
            padding-right: 20px;
            white-space: nowrap;
            color: rgba(255, 255, 255, 0.8);
        }
        
        .form-input {
            width: 100%;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            padding: 12px 15px;
            color: white;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .form-input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 2px rgba(71, 118, 230, 0.3);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .radio-group, .checkbox-group {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        .radio-option, .checkbox-option {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .form-select {
            appearance: none;
            background: rgba(255, 255, 255, 0.1) url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='white'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e") no-repeat;
            background-position: right 15px center;
            background-size: 15px;
            padding-right: 40px;
        }
        
        .submit-btn {
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            letter-spacing: 1px;
            text-transform: uppercase;
            display: block;
            margin: 30px auto 0;
            width: 200px;
            box-shadow: 0 4px 15px rgba(110, 72, 170, 0.4);
        }
        
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(110, 72, 170, 0.6);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .glow-effect {
            position: relative;
            overflow: hidden;
        }
        
        .glow-effect::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }
        
        .glow-effect:hover::after {
            left: 100%;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }
            
            .form-table {
                display: block;
            }
            
            .form-table tr {
                display: block;
                margin-bottom: 20px;
            }
            
            .form-table td {
                display: block;
                padding: 5px 0;
            }
            
            .radio-group, .checkbox-group {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>STUDENT REGISTRATION PORTAL</h2>
        <font color="green" >${msg}</font>
        <form:form action="save" modelAttribute="Student">
            <table class="form-table">
                <tr>
                    <td class="form-label">Name:</td>
                    <td><form:input path="name" class="form-input" placeholder="Enter your full name" /></td>
                </tr>
                <tr>
                    <td class="form-label">Email:</td>
                    <td><form:input path="email" class="form-input" placeholder="Enter your email address" /></td>
                </tr>
                <tr>
                    <td class="form-label">Gender:</td>
                    <td>
                        <div class="radio-group">
                            <div class="radio-option">
                                <form:radiobutton path="gender" value="Male" id="male" />
                                <label for="male">Male</label>
                            </div>
                            <div class="radio-option">
                                <form:radiobutton path="gender" value="Female" id="female" />
                                <label for="female">Female</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">Course:</td>
                    <td>
                        <form:select path="course" class="form-input form-select">
                            <form:option value="">- Select Course -</form:option>
                            <form:options items="${course}" />
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">Timings:</td>
                    <td>
                        <div class="checkbox-group">
                            <form:checkboxes items="${timing}" path="timing" element="div class='checkbox-option'" />
                        </div>
                    </td>
                </tr>
            </table>
            <button type="submit" class="submit-btn glow-effect">REGISTER</button>
            
        </form:form>
    </div>
    <a href="viewStudents">View Student</a>
</body>
</html>