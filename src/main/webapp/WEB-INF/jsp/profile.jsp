<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Skill Swap</title>

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

            /* === Navbar Height === */
            --navbar-height: 80px;

            /* === Aurora Color Palette === */
            --primary: #6366F1;
            --primary-hover: #4F46E5;
            --secondary: #8B5CF6;
            --accent: #06B6D4;
            --success: #10B981;
            --warning: #F59E0B;
            --error: #EF4444;

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

        /* Profile Page Styles */
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

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
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

        .navbar-link.nav-notifications {
            border-color: rgba(245, 158, 11, 0.3);
        }

        .navbar-link.nav-notifications:hover {
            background: rgba(245, 158, 11, 0.15);
            border-color: rgba(245, 158, 11, 0.5);
        }

        /* Notification Badge */
        .notification-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background: linear-gradient(135deg, #EF4444, #DC2626);
            color: white;
            border-radius: 50%;
            min-width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
            font-weight: 700;
            padding: 2px 6px;
            box-shadow: 0 2px 8px rgba(239, 68, 68, 0.4);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
                box-shadow: 0 2px 8px rgba(239, 68, 68, 0.4);
            }
            50% {
                transform: scale(1.1);
                box-shadow: 0 4px 12px rgba(239, 68, 68, 0.6);
            }
        }

        .navbar-link {
            position: relative;
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

        .profile-container {
            min-height: 100vh;
            padding: var(--space-lg);
            padding-top: calc(80px + var(--space-lg));
            position: relative;
            z-index: 2;
        }

        /* Enhanced Floating Background Elements */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
            overflow: hidden;
        }

        .shape {
            position: absolute;
            opacity: 0.06;
            animation: floatShape 25s infinite ease-in-out;
            filter: blur(1px);
        }

        .shape:nth-child(1) {
            top: 15%;
            left: 8%;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 50%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            top: 70%;
            right: 12%;
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, var(--secondary), var(--accent));
            transform: rotate(45deg);
            animation-delay: -10s;
        }

        .shape:nth-child(3) {
            bottom: 20%;
            left: 25%;
            width: 60px;
            height: 60px;
            background: var(--success);
            clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
            animation-delay: -20s;
        }

        @keyframes floatShape {
            0%, 100% {
                transform: translateY(0px) translateX(0px) rotate(0deg) scale(1);
                opacity: 0.06;
            }
            25% {
                transform: translateY(-30px) translateX(15px) rotate(90deg) scale(1.1);
                opacity: 0.1;
            }
            50% {
                transform: translateY(-15px) translateX(-20px) rotate(180deg) scale(0.9);
                opacity: 0.04;
            }
            75% {
                transform: translateY(-40px) translateX(10px) rotate(270deg) scale(1.05);
                opacity: 0.08;
            }
        }

        /* Header Section */
        .header-section {
            max-width: 1200px;
            margin: 0 auto var(--space-2xl);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--space-lg);
            background: rgba(255, 255, 255, 0.08);
            border-radius: var(--radius-xl);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            animation: slideInFromTop 0.8s ease-out;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
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
        }

        .header-title p {
            font-size: var(--font-lg);
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
        }

        .header-actions {
            display: flex;
            gap: var(--space-md);
        }

        .action-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            border-radius: var(--radius-lg);
            font-weight: 600;
            text-decoration: none;
            transition: all var(--duration-normal) var(--spring-easing);
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            border: 2px solid transparent;
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(20px);
        }

        .action-button:hover {
            transform: translateY(-3px) scale(1.02);
        }

        .btn-primary:hover {
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        .btn-secondary:hover {
            border-color: rgba(99, 102, 241, 0.4);
            color: var(--primary);
        }

        /* Main Content */
        .content-container {
            max-width: 1200px;
            margin: 0 auto;
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

        /* Profile Layout */
        .profile-layout {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: var(--space-2xl);
        }

        /* Profile Card */
        .profile-card {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.25) 0%,
                rgba(255, 255, 255, 0.10) 50%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: var(--radius-xl);
            padding: var(--space-2xl);
            backdrop-filter: blur(25px);
            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            transition: all var(--duration-normal) var(--spring-easing);
            position: sticky;
            top: var(--space-lg);
        }

        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow:
                0 25px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(99, 102, 241, 0.3);
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            background: var(--button-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            font-weight: 700;
            color: var(--text-white);
            margin: 0 auto var(--space-lg);
            box-shadow: 0 15px 35px rgba(99, 102, 241, 0.4);
        }

        .profile-name {
            font-size: var(--font-2xl);
            font-weight: 700;
            color: #ffffff;
            text-align: center;
            margin-bottom: var(--space-sm);
        }

        .profile-username {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.7);
            text-align: center;
            margin-bottom: var(--space-lg);
        }

        .profile-stats {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: var(--space-md);
            margin-bottom: var(--space-xl);
        }

        .stat-item {
            text-align: center;
            padding: var(--space-md);
            background: rgba(255, 255, 255, 0.05);
            border-radius: var(--radius-md);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat-number {
            font-size: var(--font-xl);
            font-weight: 700;
            color: var(--primary);
            margin-bottom: var(--space-xs);
        }

        .stat-label {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.7);
        }

        /* Rating Stars Styling */
        .rating-stat {
            grid-column: 1 / -1;
        }

        .rating-value {
            font-size: var(--font-lg);
            font-weight: 700;
            color: var(--warning);
            margin-right: var(--space-sm);
        }

        .rating-stars {
            display: inline-flex;
            gap: 2px;
        }

        .star {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.3);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .star.filled {
            color: var(--warning);
            text-shadow: 0 0 8px rgba(245, 158, 11, 0.4);
        }

        .rating-stat .stat-number {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            gap: var(--space-xs);
        }

        .profile-actions {
            display: flex;
            flex-direction: column;
            gap: var(--space-sm);
        }

        .profile-btn {
            padding: var(--space-md);
            border-radius: var(--radius-lg);
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all var(--duration-normal) var(--spring-easing);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
        }

        .profile-btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
        }

        .profile-btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .profile-btn:hover {
            transform: translateY(-2px);
        }

        /* Profile Details */
        .profile-details {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.15) 0%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            backdrop-filter: blur(40px);
            padding: var(--space-2xl);
            box-shadow:
                0 25px 80px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
        }

        .details-section {
            margin-bottom: var(--space-2xl);
        }

        .details-section:last-child {
            margin-bottom: 0;
        }

        .section-title {
            font-size: var(--font-xl);
            font-weight: 700;
            color: #ffffff;
            margin-bottom: var(--space-lg);
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .section-icon {
            width: 32px;
            height: 32px;
            background: var(--button-gradient);
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: var(--text-white);
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-lg);
        }

        .info-item {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .info-item:hover {
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-2px);
        }

        .info-label {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.6);
            margin-bottom: var(--space-xs);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
        }

        .info-value.empty {
            color: rgba(255, 255, 255, 0.4);
            font-style: italic;
        }

        .bio-text {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
        }

        .bio-text.empty {
            color: rgba(255, 255, 255, 0.4);
            font-style: italic;
        }

        .social-links {
            display: flex;
            gap: var(--space-md);
            flex-wrap: wrap;
        }

        .social-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-sm) var(--space-md);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .social-link:hover {
            background: rgba(99, 102, 241, 0.2);
            border-color: rgba(99, 102, 241, 0.4);
            transform: translateY(-2px);
        }

        /* Reviews Section */
        .reviews-container {
            display: flex;
            flex-direction: column;
            gap: var(--space-md);
        }

        .review-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .review-card:hover {
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-2px);
            border-color: rgba(99, 102, 241, 0.3);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--space-md);
        }

        .reviewer-info {
            display: flex;
            gap: var(--space-md);
            align-items: center;
        }

        .reviewer-avatar {
            width: 40px;
            height: 40px;
            background: var(--button-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: var(--font-lg);
            font-weight: 700;
            color: var(--text-white);
        }

        .reviewer-details {
            display: flex;
            flex-direction: column;
            gap: var(--space-xs);
        }

        .reviewer-name {
            font-size: var(--font-base);
            font-weight: 600;
            color: rgba(255, 255, 255, 0.9);
        }

        .review-date {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.5);
        }

        .review-rating {
            display: flex;
            gap: 2px;
        }

        .review-star {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.3);
        }

        .review-star.filled {
            color: var(--warning);
            text-shadow: 0 0 8px rgba(245, 158, 11, 0.4);
        }

        .review-comment {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.6;
            padding-top: var(--space-sm);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Skills Grid */
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: var(--space-lg);
        }

        .skill-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .skill-card:hover {
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-4px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        }

        .skill-card-header {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin-bottom: var(--space-sm);
        }

        .skill-card-title {
            font-size: var(--font-lg);
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: var(--space-xs);
        }

        .skill-level {
            padding: var(--space-xs) var(--space-sm);
            background: var(--button-gradient);
            color: white;
            border-radius: var(--radius-sm);
            font-size: var(--font-xs);
            font-weight: 600;
        }

        .skill-card-description {
            font-size: var(--font-sm);
            color: var(--text-secondary);
            line-height: 1.5;
            margin-bottom: var(--space-md);
        }

        .skill-card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: var(--space-sm);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .skill-category {
            font-size: var(--font-xs);
            color: var(--text-muted);
        }

        .view-skill-link {
            font-size: var(--font-sm);
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .view-skill-link:hover {
            color: var(--primary-hover);
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
            display: flex;
            align-items: center;
            gap: var(--space-sm);
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-container {
                padding: var(--space-md);
            }

            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .profile-layout {
                grid-template-columns: 1fr;
                gap: var(--space-xl);
            }

            .profile-card {
                position: static;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .social-links {
                justify-content: center;
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
                <a href="add-skill" class="navbar-link nav-add">
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
                <a href="notifications" class="navbar-link nav-notifications">
                    <i class="fas fa-bell"></i>
                    Notifications
                    <span class="notification-badge" id="notificationBadge" style="display: none;"></span>
                </a>
                <a href="profile" class="navbar-link nav-profile active">
                    <i class="fas fa-user"></i>
                    Profile
                </a>
            </div>
        </div>
    </nav>

    <!-- Enhanced Background Effects -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Main Container -->
    <div class="profile-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <c:choose>
                    <c:when test="${isOwnProfile}">
                        <h1><i class="fas fa-user"></i> My Profile</h1>
                        <p>จัดการข้อมูลส่วนตัวและดูสถิติการใช้งาน</p>
                    </c:when>
                    <c:otherwise>
                        <h1><i class="fas fa-user"></i> ${user.fullName}</h1>
                        <p>โปรไฟล์ผู้ใช้และทักษะ</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Content Container -->
        <div class="content-container">
            <!-- Success/Error Messages -->
            <c:if test="${param.success == 'updated'}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    <span>อัปเดตข้อมูลโปรไฟล์เรียบร้อยแล้ว!</span>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Profile Layout -->
            <div class="profile-layout">
                <!-- Profile Card -->
                <div class="profile-card">
                    <div class="profile-avatar">
                        ${user.initials}
                    </div>

                    <h2 class="profile-name">${user.fullName}</h2>
                    <p class="profile-username">@${user.username}</p>

                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-number">${totalOffers}</div>
                            <div class="stat-label">Skills</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">${sentRequests}</div>
                            <div class="stat-label">Sent</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">${receivedRequests}</div>
                            <div class="stat-label">Received</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">
                                <c:choose>
                                    <c:when test="${user.createdAt != null}">
                                        ${user.createdAt.monthValue}/${user.createdAt.year}
                                    </c:when>
                                    <c:otherwise>--</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="stat-label">Joined</div>
                        </div>
                        <div class="stat-item rating-stat">
                            <div class="stat-number">
                                <span class="rating-value">
                                    <c:choose>
                                        <c:when test="${averageRating > 0}">
                                            <fmt:formatNumber value="${averageRating}" type="number" maxFractionDigits="1"/>
                                        </c:when>
                                        <c:otherwise>--</c:otherwise>
                                    </c:choose>
                                </span>
                                <span class="rating-stars">
                                    <c:forEach begin="1" end="5" var="star">
                                        <span class="star <c:if test="${star <= averageRating}">filled</c:if>">★</span>
                                    </c:forEach>
                                </span>
                            </div>
                            <div class="stat-label">Rating (${totalRatings} reviews)</div>
                        </div>
                    </div>

                    <c:if test="${isOwnProfile}">
                        <div class="profile-actions">
                            <a href="edit-profile" class="profile-btn profile-btn-primary">
                                <i class="fas fa-edit"></i>
                                แก้ไขโปรไฟล์
                            </a>
                            <a href="my-offers" class="profile-btn profile-btn-secondary">
                                <i class="fas fa-briefcase"></i>
                                My Skills
                            </a>
                        </div>
                    </c:if>
                </div>

                <!-- Profile Details -->
                <div class="profile-details">
                    <!-- Personal Information -->
                    <c:if test="${isOwnProfile or not empty user.location}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <c:choose>
                                        <c:when test="${isOwnProfile}">
                                            <i class="fas fa-user"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-map-marker-alt"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <c:choose>
                                    <c:when test="${isOwnProfile}">ข้อมูลส่วนตัว</c:when>
                                    <c:otherwise>สถานที่</c:otherwise>
                                </c:choose>
                            </h3>

                            <c:choose>
                                <c:when test="${isOwnProfile}">
                                    <div class="info-grid">
                                        <div class="info-item">
                                            <div class="info-label">ชื่อ</div>
                                            <div class="info-value">${user.firstName}</div>
                                        </div>
                                        <div class="info-item">
                                            <div class="info-label">นามสกุล</div>
                                            <div class="info-value">${user.lastName}</div>
                                        </div>
                                        <div class="info-item">
                                            <div class="info-label">อีเมล</div>
                                            <div class="info-value">${user.email}</div>
                                        </div>
                                        <div class="info-item">
                                            <div class="info-label">เบอร์โทร</div>
                                            <div class="info-value ${empty user.phone ? 'empty' : ''}">
                                                <c:choose>
                                                    <c:when test="${not empty user.phone}">${user.phone}</c:when>
                                                    <c:otherwise>ไม่ได้ระบุ</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="info-item">
                                            <div class="info-label">ที่อยู่</div>
                                            <div class="info-value ${empty user.location ? 'empty' : ''}">
                                                <c:choose>
                                                    <c:when test="${not empty user.location}">${user.location}</c:when>
                                                    <c:otherwise>ไม่ได้ระบุ</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="info-grid">
                                        <div class="info-item">
                                            <div class="info-label">Location</div>
                                            <div class="info-value">${user.location}</div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>

                    <!-- Bio Section -->
                    <c:if test="${isOwnProfile or not empty user.bio}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <i class="fas fa-quote-left"></i>
                                </div>
                                <c:choose>
                                    <c:when test="${isOwnProfile}">เกี่ยวกับฉัน</c:when>
                                    <c:otherwise>เกี่ยวกับ</c:otherwise>
                                </c:choose>
                            </h3>

                            <div class="bio-text ${empty user.bio ? 'empty' : ''}">
                                <c:choose>
                                    <c:when test="${not empty user.bio}">${user.bio}</c:when>
                                    <c:when test="${isOwnProfile}">ยังไม่ได้เขียนข้อมูลเกี่ยวกับตัวเอง คลิกแก้ไขโปรไฟล์เพื่อเพิ่มข้อมูล</c:when>
                                </c:choose>
                            </div>
                        </div>
                    </c:if>

                    <!-- Social Links -->
                    <c:if test="${isOwnProfile or not empty user.linkedin or not empty user.github}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <i class="fas fa-link"></i>
                                </div>
                                ลิงก์โซเชียล
                            </h3>

                            <div class="social-links">
                                <c:if test="${not empty user.linkedin}">
                                    <a href="${user.linkedin}" target="_blank" class="social-link">
                                        <i class="fab fa-linkedin"></i>
                                        LinkedIn
                                    </a>
                                </c:if>
                                <c:if test="${not empty user.github}">
                                    <a href="${user.github}" target="_blank" class="social-link">
                                        <i class="fab fa-github"></i>
                                        GitHub
                                    </a>
                                </c:if>
                                <c:if test="${isOwnProfile and empty user.linkedin and empty user.github}">
                                    <p class="info-value empty">ไม่ได้เพิ่มลิงก์โซเชียล คลิกแก้ไขโปรไฟล์เพื่อเพิ่ม</p>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                    <!-- Reviews Section -->
                    <div class="details-section">
                        <h3 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-star"></i>
                            </div>
                            รีวิวและความคิดเห็น (${totalRatings})
                        </h3>

                        <c:choose>
                            <c:when test="${not empty reviews}">
                                <div class="reviews-container">
                                    <c:forEach items="${reviews}" var="review">
                                        <div class="review-card">
                                            <div class="review-header">
                                                <div class="reviewer-info">
                                                    <div class="reviewer-avatar">
                                                        ${review.raterName.substring(0, 1)}
                                                    </div>
                                                    <div class="reviewer-details">
                                                        <div class="reviewer-name">${review.raterName}</div>
                                                        <div class="review-date">
                                                            ${review.createdAt.dayOfMonth}
                                                            ${review.createdAt.month}
                                                            ${review.createdAt.year}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-rating">
                                                    <c:forEach begin="1" end="5" var="star">
                                                        <span class="review-star <c:if test="${star <= review.score}">filled</c:if>">★</span>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="review-comment">
                                                <c:choose>
                                                    <c:when test="${not empty review.comment}">
                                                        ${review.comment}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: rgba(255, 255, 255, 0.4); font-style: italic;">ไม่มีความคิดเห็น</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="bio-text empty">
                                    ยังไม่มีรีวิว เมื่อคุณช่วยเหลือผู้อื่นในการแลกเปลี่ยนทักษะ พวกเขาจะสามารถให้คะแนนและรีวิวคุณได้
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- User's Skills -->
                    <c:if test="${not empty userOffers}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <i class="fas fa-lightbulb"></i>
                                </div>
                                ทักษะทั้งหมด
                            </h3>

                            <div class="skills-grid">
                                <c:forEach var="offer" items="${userOffers}">
                                    <div class="skill-card">
                                        <div class="skill-card-header">
                                            <div>
                                                <h4 class="skill-card-title">${offer.title}</h4>
                                                <span class="skill-level">${offer.level}</span>
                                            </div>
                                        </div>
                                        <p class="skill-card-description">
                                            <c:choose>
                                                <c:when test="${offer.description.length() > 100}">
                                                    ${offer.description.substring(0, 100)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${offer.description}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <div class="skill-card-footer">
                                            <span class="skill-category">
                                                <i class="fas fa-tag"></i>
                                                ${offer.categoryName}
                                            </span>
                                            <a href="skill?id=${offer.id}" class="view-skill-link">
                                                ดูรายละเอียด <i class="fas fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Thai month names
        function getThaiMonth(monthNumber) {
            const months = {
                'JANUARY': 'มกราคม',
                'FEBRUARY': 'กุมภาพันธ์',
                'MARCH': 'มีนาคม',
                'APRIL': 'เมษายน',
                'MAY': 'พฤษภาคม',
                'JUNE': 'มิถุนายน',
                'JULY': 'กรกฎาคม',
                'AUGUST': 'สิงหาคม',
                'SEPTEMBER': 'กันยายน',
                'OCTOBER': 'ตุลาคม',
                'NOVEMBER': 'พฤศจิกายน',
                'DECEMBER': 'ธันวาคม'
            };
            return months[monthNumber] || monthNumber;
        }

        // Mobile Menu Toggle Function (must be global for onclick)
        function toggleMobileMenu() {
            const menu = document.getElementById('navbarMenu');
            menu.classList.toggle('active');
        }

        document.addEventListener('DOMContentLoaded', function() {
            // Convert month names to Thai
            document.querySelectorAll('.review-date').forEach(function(dateElement) {
                const text = dateElement.textContent.trim();
                const parts = text.split(/\s+/);
                if (parts.length === 3) {
                    const day = parts[0];
                    const month = getThaiMonth(parts[1]);
                    const year = parseInt(parts[2]) + 543; // Convert to Buddhist Era
                    dateElement.textContent = day + ' ' + month + ' ' + year;
                }
            });
            // Enhanced animations
            const elements = document.querySelectorAll('.profile-card, .profile-details');

            elements.forEach((element, index) => {
                element.style.animationDelay = `${index * 0.2}s`;
                element.classList.add('animate-in');
            });

            // Add ripple effect to buttons
            const buttons = document.querySelectorAll('.profile-btn, .action-button');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;

                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.3);
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                    `;

                    this.appendChild(ripple);
                    setTimeout(() => ripple.remove(), 600);
                });
            });

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
        });

        // Add animation styles
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }

            @keyframes animate-in {
                0% {
                    opacity: 0;
                    transform: translateY(30px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-in {
                animation: animate-in 0.6s ease-out forwards;
            }
        `;
        document.head.appendChild(style);

        // Load notification count
        function loadNotificationCount() {
            fetch('notifications/count')
                .then(response => response.json())
                .then(data => {
                    const badge = document.getElementById('notificationBadge');
                    if (data.count > 0) {
                        badge.textContent = data.count > 99 ? '99+' : data.count;
                        badge.style.display = 'flex';
                    } else {
                        badge.style.display = 'none';
                    }
                })
                .catch(error => console.error('Error loading notification count:', error));
        }

        loadNotificationCount();
        setInterval(loadNotificationCount, 30000);
    </script>
</body>
</html>