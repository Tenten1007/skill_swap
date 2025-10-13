<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สร้าง Skill Offer - Skill Swap</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        :root {
            /* === Glass Effects === */
            --glass-bg: rgba(255, 255, 255, 0.08);
            --glass-border: rgba(255, 255, 255, 0.2);
            --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            --glass-hover: rgba(255, 255, 255, 0.12);
            --blur-strength: blur(20px);

            /* === Aurora Color Palette === */
            --primary: #6366F1;
            --primary-hover: #4F46E5;
            --secondary: #8B5CF6;
            --accent: #06B6D4;
            --success: #10B981;
            --warning: #F59E0B;
            --error: #EF4444;

            /* === Aurora Gradients === */
            --bg-gradient: linear-gradient(135deg,
                rgba(99, 102, 241, 0.1) 0%,
                rgba(139, 92, 246, 0.1) 25%,
                rgba(6, 182, 212, 0.1) 50%,
                rgba(16, 185, 129, 0.1) 75%,
                rgba(245, 158, 11, 0.1) 100%);

            --button-gradient: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);

            /* === Text System - WHITE ON DARK === */
            --text-primary: #FFFFFF;
            --text-secondary: rgba(255, 255, 255, 0.8);
            --text-muted: rgba(255, 255, 255, 0.6);
            --text-white: #FFFFFF;
            --text-glass: rgba(255, 255, 255, 0.95);

            /* === Interactive States === */
            --hover-lift: translateY(-2px);
            --spring-easing: cubic-bezier(0.175, 0.885, 0.32, 1.275);
            --smooth-easing: cubic-bezier(0.4, 0, 0.2, 1);
            --duration-normal: 0.3s;

            /* === Spacing System === */
            --space-xs: 4px;
            --space-sm: 8px;
            --space-md: 16px;
            --space-lg: 24px;
            --space-xl: 32px;
            --space-2xl: 48px;

            /* === Border Radius === */
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --radius-xl: 20px;
            --radius-full: 9999px;

            /* === Font Sizes === */
            --font-xs: 0.75rem;
            --font-sm: 0.875rem;
            --font-base: 1rem;
            --font-lg: 1.125rem;
            --font-xl: 1.25rem;
            --font-2xl: 1.5rem;
            --font-3xl: 1.875rem;
            --font-4xl: 2.25rem;
        }

        /* Dark Theme Body */
        body {
            margin: 0;
            font-family: 'Inter', 'SF Pro Display', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(-45deg,
                #0f0f23 0%,
                #1a1a2e 25%,
                #16213e 50%,
                #0f3460 75%,
                #533483 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            min-height: 100vh;
            color: #ffffff;
        }

        /* === NAVBAR STYLES === */
        .modern-navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            padding: var(--space-md) var(--space-lg);
            background: linear-gradient(135deg,
                    rgba(255, 255, 255, 0.15) 0%,
                    rgba(255, 255, 255, 0.08) 100%);
            backdrop-filter: blur(40px) saturate(180%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            animation: slideDownNavbar 0.6s ease-out;
        }

        @keyframes slideDownNavbar {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .navbar-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: var(--space-lg);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            font-size: var(--font-xl);
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-decoration: none;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .navbar-brand:hover {
            transform: scale(1.05);
            filter: brightness(1.2);
        }

        .navbar-menu {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            flex-wrap: wrap;
        }

        .navbar-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-xs);
            padding: var(--space-sm) var(--space-md);
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-md);
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
            position: relative;
            overflow: hidden;
        }

        .navbar-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .navbar-link:hover::before {
            left: 100%;
        }

        .navbar-link:hover {
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
            color: var(--text-white);
            text-decoration: none;
        }

        .navbar-link.active {
            background: var(--button-gradient);
            border-color: transparent;
            color: var(--text-white);
        }

        .navbar-link.active:hover {
            box-shadow: 0 4px 16px rgba(99, 102, 241, 0.5);
        }

        /* Navbar Icons Colors */
        .navbar-link.nav-home {
            border-color: rgba(99, 102, 241, 0.3);
        }

        .navbar-link.nav-home:hover {
            background: rgba(99, 102, 241, 0.15);
            border-color: rgba(99, 102, 241, 0.5);
        }

        .navbar-link.nav-board {
            border-color: rgba(245, 158, 11, 0.3);
        }

        .navbar-link.nav-board:hover {
            background: rgba(245, 158, 11, 0.15);
            border-color: rgba(245, 158, 11, 0.5);
        }

        .navbar-link.nav-add {
            border-color: rgba(16, 185, 129, 0.3);
        }

        .navbar-link.nav-add:hover {
            background: rgba(16, 185, 129, 0.15);
            border-color: rgba(16, 185, 129, 0.5);
        }

        .navbar-link.nav-offers {
            border-color: rgba(139, 92, 246, 0.3);
        }

        .navbar-link.nav-offers:hover {
            background: rgba(139, 92, 246, 0.15);
            border-color: rgba(139, 92, 246, 0.5);
        }

        .navbar-link.nav-matches {
            border-color: rgba(6, 182, 212, 0.3);
        }

        .navbar-link.nav-matches:hover {
            background: rgba(6, 182, 212, 0.15);
            border-color: rgba(6, 182, 212, 0.5);
        }

        .navbar-link.nav-profile {
            border-color: rgba(16, 185, 129, 0.3);
        }

        .navbar-link.nav-profile:hover {
            background: rgba(16, 185, 129, 0.15);
            border-color: rgba(16, 185, 129, 0.5);
        }

        /* Mobile Menu Toggle */
        .mobile-menu-toggle {
            display: none;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-md);
            padding: var(--space-sm);
            color: var(--text-white);
            font-size: var(--font-xl);
            cursor: pointer;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .mobile-menu-toggle:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .mobile-menu-toggle {
                display: block;
            }

            .navbar-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: linear-gradient(135deg,
                        rgba(255, 255, 255, 0.15) 0%,
                        rgba(255, 255, 255, 0.08) 100%);
                backdrop-filter: blur(40px);
                border-top: 1px solid rgba(255, 255, 255, 0.2);
                padding: var(--space-md);
                flex-direction: column;
                gap: var(--space-xs);
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            }

            .navbar-menu.active {
                display: flex;
                animation: slideDownMenu 0.3s ease-out;
            }

            @keyframes slideDownMenu {
                0% {
                    opacity: 0;
                    transform: translateY(-20px);
                }

                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .navbar-link {
                width: 100%;
                justify-content: center;
                padding: var(--space-md);
            }

            .navbar-brand {
                font-size: var(--font-lg);
            }
        }

        /* Create Skill Page Styles */
        .create-skill-container {
            min-height: 100vh;
            padding: var(--space-lg);
            padding-top: calc(80px + var(--space-lg));
            position: relative;
            overflow-x: hidden;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }


        /* Header Section */
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--space-2xl);
            position: relative;
            z-index: 2;
            animation: slideInFromTop 0.8s ease-out;
            padding: var(--space-lg);
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%);
            border-radius: var(--radius-xl);
            border: 2px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(40px);
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.2);
        }

        @keyframes slideInFromTop {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header-title h1 {
            font-size: var(--font-4xl);
            font-weight: 700;
            background: linear-gradient(135deg,
                var(--primary) 0%,
                var(--secondary) 30%,
                var(--accent) 60%,
                var(--success) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            background-size: 200% 200%;
            margin-bottom: var(--space-xs);
            animation: gradientShift 4s ease-in-out infinite;
            position: relative;
        }

        .header-title h1::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg,
                rgba(99, 102, 241, 0.1) 0%,
                rgba(139, 92, 246, 0.1) 30%,
                rgba(6, 182, 212, 0.1) 60%,
                rgba(16, 185, 129, 0.1) 100%);
            border-radius: var(--radius-md);
            z-index: -1;
            filter: blur(20px);
            animation: gradientShift 4s ease-in-out infinite reverse;
        }

        @keyframes gradientShift {
            0%, 100% {
                background-position: 0% 50%;
                filter: hue-rotate(0deg);
            }
            50% {
                background-position: 100% 50%;
                filter: hue-rotate(20deg);
            }
        }

        .header-title p {
            font-size: var(--font-lg);
            color: var(--text-glass);
            font-weight: 500;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-md);
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            backdrop-filter: blur(20px);
            transition: all var(--duration-normal) var(--smooth-easing);
            position: relative;
            overflow: hidden;
        }

        .back-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s ease;
        }

        .back-button:hover::before {
            left: 100%;
        }

        .back-button:hover {
            color: var(--primary);
            background: var(--glass-hover);
            border-color: rgba(99, 102, 241, 0.3);
            transform: var(--hover-lift);
            text-decoration: none;
        }

        .back-button.logout:hover {
            background: rgba(239, 68, 68, 0.2) !important;
            border-color: rgba(239, 68, 68, 0.5) !important;
            color: #ff4444 !important;
        }

        /* Main Form Container */
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
            animation: slideInFromBottom 0.8s ease-out 0.2s both;
        }

        @keyframes slideInFromBottom {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .glass-form {
            background: linear-gradient(135deg, rgb(0 0 0) 0%, rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            backdrop-filter: blur(40px);
            padding: var(--space-2xl);
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            animation: slideInFromBottom 0.8s ease-out;
            margin-bottom: var(--space-xl);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .glass-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--button-gradient);
            border-radius: var(--radius-xl) var(--radius-xl) 0 0;
        }


        /* Form Section */
        .form-section {
            margin-bottom: var(--space-2xl);
            padding-bottom: var(--space-xl);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .form-section:last-of-type {
            border-bottom: none;
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: var(--space-lg);
            margin-bottom: var(--space-2xl);
            padding: var(--space-lg);
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.1) 0%, rgba(139, 92, 246, 0.05) 100%);
            border-radius: var(--radius-lg);
            border-left: 4px solid var(--primary);
        }

        .section-icon {
            width: 48px;
            height: 48px;
            background: var(--button-gradient);
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-primary);
            font-size: 20px;
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
            flex-shrink: 0;
        }

        .section-info {
            flex: 1;
        }

        .section-title {
            font-size: var(--font-xl);
            font-weight: 700;
            color: var(--text-primary);
            margin: 0 0 var(--space-xs) 0;
        }

        .section-description {
            font-size: var(--font-sm);
            color: var(--text-muted);
            margin: 0;
        }

        /* Form Groups */
        .form-group {
            margin-bottom: var(--space-xl);
            position: relative;
            z-index: 1;
        }

        .form-group.half-width {
            display: inline-block;
            width: 48%;
            margin-right: 4%;
            vertical-align: top;
        }

        .form-group.half-width:nth-child(even) {
            margin-right: 0;
        }

        .form-label {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            margin-bottom: var(--space-md);
            font-size: var(--font-base);
            font-weight: 600;
            color: var(--text-primary);
        }

        .form-label i {
            color: var(--primary);
            font-size: var(--font-lg);
        }

        .form-label.required::after {
            content: '*';
            color: var(--error);
            margin-left: var(--space-xs);
        }

        .required-badge {
            display: inline-flex;
            align-items: center;
            padding: var(--space-xs) var(--space-sm);
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: var(--radius-sm);
            font-size: var(--font-xs);
            color: var(--error);
            margin-left: auto;
        }

        /* Enhanced Form Inputs - Match glass-card style */
        .form-input,
        .form-textarea,
        .form-select {
            width: 100%;
            padding: var(--space-lg) var(--space-xl);
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            color: #FFFFFF;
            font-size: var(--font-base);
            font-weight: 400;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s var(--smooth-easing);
            backdrop-filter: blur(40px);
            box-sizing: border-box;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.2);
        }

        .form-input:hover,
        .form-textarea:hover,
        .form-select:hover {
            border-color: var(--primary);
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.15) 0%, rgba(139, 92, 246, 0.1) 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
            outline: none;
            border-color: var(--primary);
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.2) 0%, rgba(139, 92, 246, 0.15) 100%);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.15), 0 10px 30px rgba(99, 102, 241, 0.4);
            transform: translateY(-2px);
        }

        .form-input::placeholder,
        .form-textarea::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        .form-textarea {
            min-height: 120px;
            resize: vertical;
            font-family: inherit;
        }

        .form-select {
            cursor: pointer;
            appearance: none;
            background-image: url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="rgba(255,255,255,0.7)" d="m0,1l2,2l2,-2z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 16px center;
            background-size: 12px;
            padding-right: 50px;
        }

        .form-select option {
            background: #1a1a2e;
            color: #FFFFFF;
            padding: 12px;
            font-weight: 400;
        }

        /* Enhanced Category Dropdown */
        .category-input-wrapper {
            position: relative;
        }

        .category-icon {
            position: absolute;
            left: var(--space-lg);
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: rgba(255, 255, 255, 0.7);
            z-index: 2;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .category-input-wrapper:focus-within .category-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        .form-select.with-icon {
            padding-left: 60px;
        }

        /* Form Hint */
        .form-hint {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            font-size: var(--font-sm);
            color: var(--text-muted);
            padding: var(--space-sm) var(--space-md);
            margin-top: var(--space-sm);
            background: rgba(255, 255, 255, 0.05);
            border-radius: var(--radius-sm);
            border-left: 3px solid var(--primary);
        }

        .form-hint i {
            color: var(--primary);
            font-size: var(--font-base);
        }

        /* Success/Error Messages */
        .alert {
            padding: var(--space-lg);
            border-radius: var(--radius-md);
            margin-bottom: var(--space-lg);
            font-weight: 500;
            backdrop-filter: blur(20px);
            border: 1px solid;
            animation: slideInFromTop 0.5s ease-out;
        }

        .alert-success {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
            border-color: rgba(16, 185, 129, 0.3);
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border-color: rgba(239, 68, 68, 0.3);
        }

        /* Submit Button */
        .submit-section {
            display: flex;
            gap: var(--space-lg);
            margin-top: var(--space-2xl);
            justify-content: flex-end;
        }

        .btn-primary,
        .btn-secondary {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-lg) var(--space-2xl);
            border: none;
            border-radius: var(--radius-lg);
            font-size: var(--font-base);
            font-weight: 600;
            text-decoration: none;
            transition: all var(--duration-normal) var(--spring-easing);
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.25);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-glass);
            border: 2px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        .btn-primary::before,
        .btn-secondary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s ease;
        }

        .btn-primary:hover::before,
        .btn-secondary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            border-color: rgba(99, 102, 241, 0.4);
            color: var(--primary);
        }

        /* Form Validation Styles */
        .form-input.error,
        .form-textarea.error,
        .form-select.error {
            border-color: rgba(239, 68, 68, 0.5);
            background: rgba(239, 68, 68, 0.03);
        }

        .form-input.success,
        .form-textarea.success,
        .form-select.success {
            border-color: rgba(16, 185, 129, 0.5);
            background: rgba(16, 185, 129, 0.03);
        }

        /* Loading State */
        .loading {
            opacity: 0.7;
            pointer-events: none;
            position: relative;
        }

        .loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            margin: -10px 0 0 -10px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: var(--primary);
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .create-skill-container {
                padding: var(--space-md);
            }

            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .header-title h1 {
                font-size: var(--font-3xl);
            }

            .glass-form {
                padding: var(--space-lg);
            }

            .form-group.half-width {
                width: 100%;
                margin-right: 0;
                display: block;
            }

            .submit-section {
                flex-direction: column;
            }

            .btn-primary,
            .btn-secondary {
                width: 100%;
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .header-title h1 {
                font-size: var(--font-2xl);
            }

            .glass-form {
                padding: var(--space-md);
            }

            .form-input,
            .form-textarea,
            .form-select {
                padding: var(--space-md);
            }
        }
    </style>
</head>

<body>

    <!-- Modern Navbar -->
    <nav class="modern-navbar">
        <div class="navbar-container">
            <a href="home" class="navbar-brand">
                <i class="fas fa-exchange-alt"></i>
                Skill Swap
            </a>

            <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
                <i class="fas fa-bars"></i>
            </button>

            <div class="navbar-menu" id="navbarMenu">
                <a href="home" class="navbar-link nav-home">
                    <i class="fas fa-home"></i>
                    For You
                </a>
                <a href="jobboard" class="navbar-link nav-board">
                    <i class="fas fa-search"></i>
                    Browse All
                </a>
                <a href="add-skill" class="navbar-link nav-add active">
                    <i class="fas fa-plus-circle"></i>
                    Add Skill
                </a>
                <a href="my-offers" class="navbar-link nav-offers">
                    <i class="fas fa-briefcase"></i>
                    My Skills
                </a>
                <a href="matches" class="navbar-link nav-matches">
                    <i class="fas fa-handshake"></i>
                    Matches
                </a>
                <a href="profile" class="navbar-link nav-profile">
                    <i class="fas fa-user"></i>
                    Profile
                </a>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="create-skill-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-plus-circle"></i> สร้าง Skill Offer</h1>
                <p>แชร์ทักษะของคุณให้กับชุมชน</p>
            </div>
            <div style="display: flex; gap: var(--space-md);">
                <a href="home" class="back-button">
                    <i class="fas fa-arrow-left"></i>
                    กลับหน้าหลัก
                </a>
                <a href="doLogout" class="back-button logout" style="background: rgba(239, 68, 68, 0.1); border-color: rgba(239, 68, 68, 0.3); color: var(--error);">
                    <i class="fas fa-sign-out-alt"></i>
                    ออกจากระบบ
                </a>
            </div>
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <!-- Success/Error Messages -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    ${error}
                </div>
            </c:if>

            <c:if test="${param.success == 'skill-created'}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    สร้าง Skill Offer สำเร็จแล้ว!
                </div>
            </c:if>

            <!-- Main Form -->
            <form method="POST" action="add-skill" class="glass-form" id="skillForm">

                <!-- Section 1: Basic Information -->
                <div class="form-section">
                    <div class="section-header">
                        <div class="section-icon">
                            <i class="fas fa-info-circle"></i>
                        </div>
                        <div class="section-info">
                            <h3 class="section-title">ข้อมูลพื้นฐาน</h3>
                            <p class="section-description">บอกเราเกี่ยวกับทักษะของคุณ</p>
                        </div>
                    </div>

                    <!-- Title -->
                    <div class="form-group">
                        <label for="title" class="form-label">
                            <i class="fas fa-tag"></i>
                            <span>ชื่อทักษะ</span>
                            <span class="required-badge">จำเป็น</span>
                        </label>
                        <input type="text"
                               id="title"
                               name="title"
                               class="form-input"
                               placeholder="เช่น สอน JavaScript เบื้องต้น, ถ่ายรูปแนว Portrait, สอนทำอาหารไทย"
                               required>
                        <div class="form-hint">
                            <i class="fas fa-lightbulb"></i>
                            <span>ใช้ชื่อที่สั้น กระชับ และบอกถึงสิ่งที่คุณสอนได้ชัดเจน</span>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label for="description" class="form-label">
                            <i class="fas fa-align-left"></i>
                            <span>รายละเอียดทักษะ</span>
                            <span class="required-badge">จำเป็น</span>
                        </label>
                        <textarea id="description"
                                  name="description"
                                  class="form-textarea"
                                  placeholder="อธิบายทักษะของคุณ สิ่งที่จะสอน ประสบการณ์ และสิ่งที่ผู้เรียนจะได้รับ..."
                                  required></textarea>
                        <div class="form-hint">
                            <i class="fas fa-lightbulb"></i>
                            <span>เขียนรายละเอียดที่น่าสนใจ อธิบายว่าคุณมีประสบการณ์อะไร และผู้เรียนจะได้อะไรบ้าง</span>
                        </div>
                    </div>
                </div>

                <!-- Category and Level Row -->
                <div class="form-group half-width">
                    <label for="categoryId" class="form-label required">หมวดหมู่</label>
                    <div class="category-input-wrapper">
                        <i class="fas fa-layer-group category-icon" id="categoryIcon"></i>
                        <select id="categoryId" name="categoryId" class="form-select with-icon" required>
                            <option value="">เลือกหมวดหมู่</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group half-width">
                    <label for="level" class="form-label required">ระดับ</label>
                    <select id="level" name="level" class="form-select" required>
                        <option value="">เลือกระดับ</option>
                        <option value="Beginner">🌱 เริ่มต้น (Beginner)</option>
                        <option value="Intermediate">🚀 ปานกลาง (Intermediate)</option>
                        <option value="Advanced">⭐ ขั้นสูง (Advanced)</option>
                        <option value="Expert">👑 ผู้เชี่ยวชาญ (Expert)</option>
                    </select>
                </div>

                <!-- Time Commitment and Location Row -->
                <div class="form-group half-width">
                    <label for="timeCommitment" class="form-label">ระยะเวลา</label>
                    <select id="timeCommitment" name="timeCommitment" class="form-select">
                        <option value="">เลือกระยะเวลา</option>
                        <option value="1-2 ชั่วโมง">⏰ 1-2 ชั่วโมง</option>
                        <option value="ครึ่งวัน">🕐 ครึ่งวัน (4-5 ชั่วโมง)</option>
                        <option value="เต็มวัน">📅 เต็มวัน (8+ ชั่วโมง)</option>
                        <option value="หลายวัน">📆 หลายวัน</option>
                        <option value="ยืดหยุ่น">🔄 ยืดหยุ่นได้</option>
                    </select>
                </div>

                <div class="form-group half-width">
                    <label for="location" class="form-label">สถานที่</label>
                    <input type="text"
                           id="location"
                           name="location"
                           class="form-input"
                           placeholder="เช่น กรุงเทพ, เชียงใหม่, Online">
                </div>

                <!-- Submit Section -->
                <div class="submit-section">
                    <a href="home" class="btn-secondary">
                        <i class="fas fa-times"></i>
                        ยกเลิก
                    </a>
                    <button type="submit" class="btn-primary" id="submitBtn">
                        <i class="fas fa-plus-circle"></i>
                        สร้าง Skill Offer
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('skillForm');
            const categorySelect = document.getElementById('categoryId');
            const categoryIcon = document.getElementById('categoryIcon');
            const submitBtn = document.getElementById('submitBtn');

            // Category icon mapping (same as home page)
            function getCategoryIcon(categoryName) {
                const categoryIcons = {
                    'Programming': 'fas fa-code',
                    'Design': 'fas fa-palette',
                    'Marketing': 'fas fa-chart-line',
                    'Photography': 'fas fa-camera',
                    'Music': 'fas fa-music',
                    'Language': 'fas fa-globe-americas',
                    'Cooking': 'fas fa-utensils',
                    'Fitness': 'fas fa-dumbbell',
                    'Writing': 'fas fa-feather-alt',
                    'Business': 'fas fa-briefcase'
                };

                return categoryIcons[categoryName] || 'fas fa-layer-group';
            }

            // Update category icon
            function updateCategoryIcon() {
                const selectedOption = categorySelect.options[categorySelect.selectedIndex];
                const categoryName = selectedOption.textContent.trim().replace(/^[^\s]+\s/, ''); // Remove emoji
                const iconClass = getCategoryIcon(categoryName);

                categoryIcon.className = iconClass + ' category-icon';
                categoryIcon.style.color = categorySelect.value ? 'var(--primary)' : 'rgba(255, 255, 255, 0.7)';
            }

            // Category change handler
            categorySelect.addEventListener('change', function() {
                updateCategoryIcon();
                validateField(this);
            });

            // Form validation
            function validateField(field) {
                const value = field.value.trim();

                if (field.hasAttribute('required') && !value) {
                    field.classList.add('error');
                    field.classList.remove('success');
                    return false;
                } else if (value) {
                    field.classList.add('success');
                    field.classList.remove('error');
                    return true;
                } else {
                    field.classList.remove('error', 'success');
                    return true;
                }
            }

            // Add validation to required fields
            const requiredFields = form.querySelectorAll('[required]');
            requiredFields.forEach(field => {
                field.addEventListener('blur', () => validateField(field));
                field.addEventListener('input', () => {
                    if (field.classList.contains('error')) {
                        validateField(field);
                    }
                });
            });

            // Form submit handler
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                let isValid = true;
                requiredFields.forEach(field => {
                    if (!validateField(field)) {
                        isValid = false;
                    }
                });

                if (!isValid) {
                    // Scroll to first error
                    const firstError = form.querySelector('.error');
                    if (firstError) {
                        firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                        firstError.focus();
                    }
                    return;
                }

                // Add loading state
                form.classList.add('loading');
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> กำลังสร้าง...';

                // Submit form
                setTimeout(() => {
                    form.submit();
                }, 500);
            });

            // Enhanced input animations
            const inputs = form.querySelectorAll('.form-input, .form-textarea, .form-select');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });

                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = '';
                });
            });

            // Initialize category icon
            updateCategoryIcon();
        });

        // Mobile Menu Toggle Function
        function toggleMobileMenu() {
            const menu = document.getElementById('navbarMenu');
            menu.classList.toggle('active');
        }

        // Close mobile menu when clicking outside
        document.addEventListener('click', function (event) {
            const navbar = document.querySelector('.modern-navbar');
            const menu = document.getElementById('navbarMenu');
            const toggle = document.querySelector('.mobile-menu-toggle');

            if (navbar && menu && toggle) {
                if (!navbar.contains(event.target)) {
                    menu.classList.remove('active');
                }
            }
        });
    </script>
</body>
</html>