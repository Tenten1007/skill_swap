<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Swap - Home Feed</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* Enhanced Home Feed styles with modern animations */
        .home-container {
            min-height: 100vh;
            background: var(--bg-gradient);
            padding: var(--space-lg);
            position: relative;
            overflow-x: hidden;
        }

        /* Floating geometric shapes */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .shape {
            position: absolute;
            opacity: 0.1;
            animation: floatShape 20s infinite linear;
        }

        .shape:nth-child(1) {
            top: 20%;
            left: 10%;
            width: 60px;
            height: 60px;
            background: var(--primary);
            border-radius: 50%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            top: 60%;
            right: 15%;
            width: 40px;
            height: 40px;
            background: var(--secondary);
            transform: rotate(45deg);
            animation-delay: -5s;
        }

        .shape:nth-child(3) {
            bottom: 30%;
            left: 20%;
            width: 0;
            height: 0;
            border-left: 25px solid transparent;
            border-right: 25px solid transparent;
            border-bottom: 43px solid var(--accent);
            animation-delay: -10s;
        }

        .shape:nth-child(4) {
            top: 80%;
            right: 30%;
            width: 50px;
            height: 50px;
            background: var(--success);
            border-radius: 20%;
            animation-delay: -15s;
        }

        @keyframes floatShape {
            0% { transform: translateY(0px) rotate(0deg); }
            25% { transform: translateY(-20px) rotate(90deg); }
            50% { transform: translateY(-10px) rotate(180deg); }
            75% { transform: translateY(-25px) rotate(270deg); }
            100% { transform: translateY(0px) rotate(360deg); }
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--space-xl);
            position: relative;
            z-index: 2;
            animation: slideInFromTop 0.8s ease-out;
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

        .welcome-info h1 {
            font-size: var(--font-3xl);
            font-weight: 700;
            color: var(--text-glass);
            text-shadow: 0 2px 4px rgba(255, 255, 255, 0.8);
            margin-bottom: var(--space-xs);
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 50%, var(--accent) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: gradientShift 3s ease-in-out infinite;
        }

        @keyframes gradientShift {
            0%, 100% { filter: hue-rotate(0deg); }
            50% { filter: hue-rotate(20deg); }
        }

        .welcome-info p {
            font-size: var(--font-base);
            color: var(--text-glass-secondary);
            font-weight: 500;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: var(--space-md);
            padding: var(--space-md) var(--space-lg);
            background: var(--glass-bg-strong);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            backdrop-filter: var(--blur-strength);
            position: relative;
            overflow: hidden;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .user-profile::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s ease;
        }

        .user-profile:hover::before {
            left: 100%;
        }

        .user-profile:hover {
            transform: var(--hover-lift);
            border-color: rgba(99, 102, 241, 0.4);
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            background: var(--button-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            font-size: 20px;
        }

        .user-name {
            font-size: var(--font-base);
            font-weight: 600;
            color: var(--text-glass);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        /* Ultra-Modern Search and Filter Section */
        .search-filter-section {
            margin-bottom: var(--space-xl);
            position: relative;
            animation: slideInFromLeft 0.8s ease-out 0.2s both;
            padding: var(--space-xl);
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            backdrop-filter: blur(40px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        @keyframes slideInFromLeft {
            0% {
                opacity: 0;
                transform: translateX(-50px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Modern Search Bar */
        .search-bar {
            display: flex;
            gap: var(--space-lg);
            margin-bottom: var(--space-xl);
            position: relative;
        }

        .search-input-group {
            flex: 1;
            position: relative;
            overflow: hidden;
            border-radius: var(--radius-xl);
        }

        .search-input-group::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.1) 100%);
            border-radius: var(--radius-xl);
            z-index: 1;
            opacity: 0;
            transition: opacity var(--duration-normal) var(--smooth-easing);
        }

        .search-input-group:hover::before {
            opacity: 1;
        }

        .search-input {
            width: 100%;
            padding: var(--space-lg) var(--space-lg) var(--space-lg) 60px;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            font-size: var(--font-lg);
            font-weight: 500;
            color: var(--text-glass);
            backdrop-filter: blur(20px);
            transition: all var(--duration-normal) var(--smooth-easing);
            position: relative;
            z-index: 2;
            letter-spacing: 0.02em;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
            font-weight: 400;
        }

        .search-input:focus {
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2), 0 20px 40px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
            outline: none;
        }

        .search-icon {
            position: absolute;
            left: var(--space-lg);
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            font-size: 20px;
            z-index: 3;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .search-input:focus + .search-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        .search-button {
            padding: var(--space-lg) var(--space-2xl);
            background: var(--button-gradient);
            border: none;
            border-radius: var(--radius-xl);
            color: var(--text-white);
            font-size: var(--font-base);
            font-weight: 600;
            white-space: nowrap;
            position: relative;
            overflow: hidden;
            transition: all var(--duration-normal) var(--smooth-easing);
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
        }

        .search-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s ease;
        }

        .search-button:hover::before {
            left: 100%;
        }

        .search-button:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        /* Enhanced Filter Section */
        .filter-section-header {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            margin-bottom: var(--space-md);
            font-size: var(--font-sm);
            font-weight: 600;
            color: rgba(255, 255, 255, 0.8);
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .filter-row {
            display: grid;
            grid-template-columns: 1fr 1fr auto auto;
            gap: var(--space-lg);
            align-items: center;
        }

        /* Enhanced Premium Category Dropdown Styles */
        .custom-select-wrapper {
            position: relative;
            overflow: visible;
            border-radius: var(--radius-xl);
            background: linear-gradient(135deg,
                rgba(99, 102, 241, 0.08) 0%,
                rgba(139, 92, 246, 0.06) 50%,
                rgba(6, 182, 212, 0.04) 100%);
            border: 2px solid transparent;
            backdrop-filter: blur(40px);
            box-shadow:
                0 10px 30px rgba(99, 102, 241, 0.15),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            transition: all var(--duration-normal) var(--spring-easing);
            position: relative;
        }

        .custom-select-wrapper::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(135deg,
                var(--primary) 0%,
                var(--secondary) 50%,
                var(--accent) 100%);
            border-radius: var(--radius-xl);
            z-index: -1;
            opacity: 0;
            transition: opacity var(--duration-normal) var(--smooth-easing);
        }

        .custom-select-wrapper::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.25) 0%,
                rgba(255, 255, 255, 0.1) 50%,
                rgba(255, 255, 255, 0.05) 100%);
            border-radius: var(--radius-lg);
            z-index: 1;
            opacity: 0;
            transition: opacity var(--duration-normal) var(--smooth-easing);
        }

        .custom-select-wrapper:hover::before {
            opacity: 1;
        }

        .custom-select-wrapper:hover::after {
            opacity: 1;
        }

        .custom-select-wrapper:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow:
                0 20px 50px rgba(99, 102, 241, 0.25),
                0 0 0 1px rgba(255, 255, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.4);
        }

        .custom-select-wrapper.dropdown-focused {
            transform: translateY(-4px) scale(1.02);
            box-shadow:
                0 25px 60px rgba(99, 102, 241, 0.3),
                0 0 0 3px rgba(99, 102, 241, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.4);
        }

        .custom-select-wrapper.dropdown-focused::before {
            opacity: 1;
        }

        .custom-select-wrapper.dropdown-focused::after {
            opacity: 1;
        }

        /* Enhanced Premium Select Input */
        .filter-select {
            width: 100%;
            padding: var(--space-lg) 60px var(--space-lg) 70px;
            background: transparent;
            border: none;
            border-radius: var(--radius-xl);
            color: var(--text-glass);
            font-size: var(--font-base);
            font-weight: 600;
            cursor: pointer;
            transition: all var(--duration-normal) var(--spring-easing);
            appearance: none;
            position: relative;
            z-index: 5;
            letter-spacing: 0.02em;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .filter-select:focus {
            outline: none;
            color: var(--primary);
            text-shadow: 0 0 8px rgba(99, 102, 241, 0.4);
        }

        .filter-select:hover {
            color: var(--primary);
            text-shadow: 0 0 6px rgba(99, 102, 241, 0.3);
        }

        /* Enhanced Select Options */
        .filter-select option {
            background: rgba(255, 255, 255, 0.95);
            color: #2D3748;
            padding: 14px 20px;
            font-weight: 500;
            font-size: var(--font-base);
            border: none;
            backdrop-filter: blur(10px);
            transition: all 0.2s ease;
        }

        .filter-select option:hover {
            background: linear-gradient(135deg,
                rgba(99, 102, 241, 0.15) 0%,
                rgba(139, 92, 246, 0.10) 100%);
            color: var(--primary);
        }

        .filter-select option:checked {
            background: linear-gradient(135deg,
                rgba(99, 102, 241, 0.2) 0%,
                rgba(139, 92, 246, 0.15) 100%);
            color: var(--primary);
            font-weight: 600;
        }

        /* Enhanced Custom Dropdown Icon */
        .dropdown-arrow {
            position: absolute;
            right: var(--space-lg);
            top: 50%;
            width: 12px;
            height: 12px;
            pointer-events: none;
            z-index: 6;
            transition: all var(--duration-normal) var(--spring-easing);
            transform: translateY(-50%);
        }

        .dropdown-arrow::before,
        .dropdown-arrow::after {
            content: '';
            position: absolute;
            width: 8px;
            height: 2px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 2px;
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .dropdown-arrow::before {
            transform: rotate(45deg) translate(2px, 2px);
            transform-origin: center;
        }

        .dropdown-arrow::after {
            transform: rotate(-45deg) translate(-2px, 2px);
            transform-origin: center;
        }

        .custom-select-wrapper:hover .dropdown-arrow::before,
        .custom-select-wrapper:hover .dropdown-arrow::after {
            background: var(--primary);
            box-shadow: 0 0 8px rgba(99, 102, 241, 0.5);
        }

        .custom-select-wrapper:focus-within .dropdown-arrow::before,
        .custom-select-wrapper:focus-within .dropdown-arrow::after {
            background: var(--primary);
            box-shadow: 0 0 12px rgba(99, 102, 241, 0.6);
        }

        .custom-select-wrapper.dropdown-focused .dropdown-arrow {
            transform: translateY(-50%) rotate(180deg);
        }

        .custom-select-wrapper:hover .dropdown-arrow {
            transform: translateY(-50%) scale(1.1);
        }

        /* Enhanced Category Icon Styling */
        .category-icon {
            position: absolute;
            left: var(--space-lg);
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: rgba(255, 255, 255, 0.8);
            z-index: 6;
            transition: all var(--duration-normal) var(--spring-easing);
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            filter: drop-shadow(0 0 4px rgba(255, 255, 255, 0.2));
        }

        .custom-select-wrapper:hover .category-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.15);
            text-shadow: 0 0 12px rgba(99, 102, 241, 0.6);
            filter: drop-shadow(0 0 8px rgba(99, 102, 241, 0.4));
        }

        .custom-select-wrapper:focus-within .category-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.15);
            text-shadow: 0 0 15px rgba(99, 102, 241, 0.8);
            filter: drop-shadow(0 0 10px rgba(99, 102, 241, 0.5));
        }

        .custom-select-wrapper.dropdown-focused .category-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.2);
            text-shadow: 0 0 18px rgba(99, 102, 241, 1);
            filter: drop-shadow(0 0 12px rgba(99, 102, 241, 0.6));
        }

        /* Enhanced Select with Icons */
        .filter-select.with-icon {
            padding-left: 60px;
        }

        /* Custom Option Styling (for modern browsers) */
        .filter-select option {
            background: rgba(255, 255, 255, 0.95);
            color: #333;
            padding: 12px 16px;
            font-weight: 500;
            border: none;
        }

        .filter-select option:hover {
            background: rgba(99, 102, 241, 0.1);
            color: var(--primary);
        }

        /* Premium Dropdown Animation */
        .custom-select-wrapper.dropdown-open {
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .custom-select-wrapper.dropdown-open::after {
            transform: translateY(-50%) rotate(180deg);
            border-top-color: var(--primary);
        }

        /* Premium Location Input */
        .location-input-wrapper {
            position: relative;
            overflow: visible;
            border-radius: var(--radius-xl);
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(40px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .location-input-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.1) 100%);
            border-radius: var(--radius-xl);
            z-index: 1;
            opacity: 0;
            transition: opacity var(--duration-normal) var(--smooth-easing);
        }

        .location-input-wrapper:hover::before {
            opacity: 1;
        }

        .location-input-wrapper:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            border-color: rgba(99, 102, 241, 0.3);
        }

        .location-input {
            width: 100%;
            padding: var(--space-lg) 50px var(--space-lg) 60px;
            background: transparent;
            border: none;
            border-radius: var(--radius-xl);
            color: var(--text-glass);
            font-size: var(--font-base);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
            position: relative;
            z-index: 2;
            letter-spacing: 0.02em;
        }

        .location-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
            font-weight: 400;
        }

        .location-input:focus {
            outline: none;
            color: var(--primary);
        }

        .location-input:hover {
            color: var(--primary);
        }

        .location-input:focus + .location-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        /* Location Icon */
        .location-icon {
            position: absolute;
            left: var(--space-lg);
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: rgba(255, 255, 255, 0.7);
            z-index: 3;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .location-input-wrapper:hover .location-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        .location-input-wrapper:focus-within .location-icon {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        /* Enhanced Clear and Filter Buttons */
        .clear-filters {
            display: inline-flex;
            align-items: center;
            gap: var(--space-xs);
            padding: var(--space-md) var(--space-lg);
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.2) 0%, rgba(220, 38, 38, 0.2) 100%);
            border: 2px solid rgba(239, 68, 68, 0.3);
            border-radius: var(--radius-lg);
            color: #ff6b6b;
            font-size: var(--font-sm);
            font-weight: 600;
            text-decoration: none;
            transition: all var(--duration-normal) var(--smooth-easing);
            backdrop-filter: blur(20px);
            position: relative;
            overflow: hidden;
        }

        .clear-filters::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .clear-filters:hover::before {
            left: 100%;
        }

        .clear-filters:hover {
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.3) 0%, rgba(220, 38, 38, 0.3) 100%);
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 10px 25px rgba(239, 68, 68, 0.3);
            text-decoration: none;
            color: #ff5252;
        }

        .filter-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-xs);
            padding: var(--space-md) var(--space-lg);
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.2) 0%, rgba(139, 92, 246, 0.2) 100%);
            border: 2px solid rgba(99, 102, 241, 0.3);
            border-radius: var(--radius-lg);
            color: var(--primary);
            font-size: var(--font-sm);
            font-weight: 600;
            cursor: pointer;
            transition: all var(--duration-normal) var(--smooth-easing);
            backdrop-filter: blur(20px);
            position: relative;
            overflow: hidden;
        }

        .filter-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .filter-button:hover::before {
            left: 100%;
        }

        .filter-button:hover {
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.3) 0%, rgba(139, 92, 246, 0.3) 100%);
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 10px 25px rgba(99, 102, 241, 0.3);
        }

        /* Feed Section */
        .feed-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--space-lg);
        }

        .feed-title {
            font-size: var(--font-2xl);
            font-weight: 600;
            color: var(--text-glass);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .add-skill-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            background: var(--button-gradient);
            color: var(--text-white);
            border: none;
            border-radius: var(--radius-md);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
            box-shadow: 0 4px 16px rgba(0, 122, 255, 0.3);
            position: relative;
            overflow: hidden;
            animation: pulse 2s infinite;
        }

        .add-skill-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        .add-skill-button:hover::before {
            left: 100%;
        }

        @keyframes pulse {
            0% { box-shadow: 0 4px 16px rgba(0, 122, 255, 0.3); }
            50% { box-shadow: 0 4px 20px rgba(0, 122, 255, 0.5); }
            100% { box-shadow: 0 4px 16px rgba(0, 122, 255, 0.3); }
        }

        .add-skill-button:hover {
            transform: var(--hover-lift);
            box-shadow: 0 8px 32px rgba(0, 122, 255, 0.4);
            text-decoration: none;
            color: var(--text-white);
        }

        /* Enhanced Skill Offers Grid with staggered animation */
        .skill-offers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: var(--space-lg);
            margin-bottom: var(--space-2xl);
            position: relative;
            z-index: 2;
        }

        .skill-offers-grid .skill-offer-card {
            animation: slideInUp 0.6s ease-out both;
        }

        .skill-offers-grid .skill-offer-card:nth-child(1) { animation-delay: 0.1s; }
        .skill-offers-grid .skill-offer-card:nth-child(2) { animation-delay: 0.2s; }
        .skill-offers-grid .skill-offer-card:nth-child(3) { animation-delay: 0.3s; }
        .skill-offers-grid .skill-offer-card:nth-child(4) { animation-delay: 0.4s; }
        .skill-offers-grid .skill-offer-card:nth-child(5) { animation-delay: 0.5s; }
        .skill-offers-grid .skill-offer-card:nth-child(6) { animation-delay: 0.6s; }
        .skill-offers-grid .skill-offer-card:nth-child(n+7) { animation-delay: 0.7s; }

        @keyframes slideInUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .skill-offer-card {
            padding: var(--space-lg);
            transition: all var(--duration-normal) var(--smooth-easing);
            cursor: pointer;
            position: relative;
            overflow: hidden;
            border-left: 4px solid transparent;
        }

        .skill-offer-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--button-gradient);
            opacity: 0;
            transition: opacity var(--duration-normal) var(--smooth-easing);
            z-index: -1;
        }

        .skill-offer-card::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.3) 0%, transparent 70%);
            transform: translate(-50%, -50%);
            transition: all 0.6s ease;
            border-radius: 50%;
            pointer-events: none;
        }

        .skill-offer-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            border-left-color: var(--primary);
        }

        .skill-offer-card:hover::before {
            opacity: 0.05;
        }

        .skill-offer-card:hover::after {
            width: 200px;
            height: 200px;
        }

        .skill-offer-card:active {
            transform: translateY(-4px) scale(1.01);
        }

        .skill-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--space-md);
        }

        .skill-category {
            padding: var(--space-xs) var(--space-sm);
            background: rgba(0, 122, 255, 0.15);
            color: var(--primary);
            border-radius: var(--radius-sm);
            font-size: var(--font-xs);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            position: relative;
            overflow: hidden;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .skill-category::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.5s ease;
        }

        .skill-offer-card:hover .skill-category::before {
            left: 100%;
        }

        .skill-date {
            font-size: var(--font-xs);
            color: var(--text-glass-secondary);
            opacity: 0.8;
        }

        .skill-title {
            font-size: var(--font-xl);
            font-weight: 600;
            color: var(--text-glass);
            margin-bottom: var(--space-sm);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
            line-height: 1.3;
        }

        .skill-description {
            font-size: var(--font-sm);
            color: var(--text-glass-secondary);
            line-height: 1.5;
            margin-bottom: var(--space-md);
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .skill-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .skill-user {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .skill-user-avatar {
            width: 32px;
            height: 32px;
            background: var(--accent);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            font-size: 14px;
        }

        .skill-username {
            font-size: var(--font-sm);
            font-weight: 500;
            color: var(--text-glass);
        }

        .skill-location {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            font-size: var(--font-xs);
            color: var(--text-glass-secondary);
        }

        /* Enhanced Empty State */
        .empty-state {
            text-align: center;
            padding: var(--space-2xl);
            color: var(--text-glass-secondary);
            animation: fadeInScale 0.8s ease-out;
        }

        @keyframes fadeInScale {
            0% {
                opacity: 0;
                transform: scale(0.9);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .empty-state i {
            font-size: 64px;
            margin-bottom: var(--space-lg);
            opacity: 0.5;
        }

        .empty-state h3 {
            font-size: var(--font-xl);
            margin-bottom: var(--space-md);
            color: var(--text-glass);
        }

        /* Logout Section */
        .logout-section {
            text-align: center;
            padding: var(--space-lg);
            border-top: 1px solid var(--glass-border);
        }

        .logout-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: var(--radius-md);
            color: var(--error);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .logout-button:hover {
            background: rgba(239, 68, 68, 0.2);
            transform: var(--hover-lift);
            text-decoration: none;
            color: var(--error);
        }

        /* Enhanced Mobile Responsiveness */
        @media (max-width: 768px) {
            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .search-filter-section {
                padding: var(--space-lg);
                margin: 0 -var(--space-sm);
            }

            .search-bar {
                flex-direction: column;
                gap: var(--space-md);
            }

            .search-input {
                padding: var(--space-md) var(--space-md) var(--space-md) 50px;
                font-size: var(--font-base);
            }

            .search-button {
                padding: var(--space-md) var(--space-lg);
                font-size: var(--font-sm);
                width: 100%;
            }

            .filter-row {
                grid-template-columns: 1fr;
                gap: var(--space-md);
            }

            .custom-select-wrapper,
            .location-input {
                width: 100%;
            }

            .clear-filters,
            .filter-button {
                width: 100%;
                justify-content: center;
            }

            .skill-offers-grid {
                grid-template-columns: 1fr;
                gap: var(--space-md);
            }

            .feed-header {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .welcome-info h1 {
                font-size: var(--font-2xl);
            }

            .user-profile {
                padding: var(--space-sm) var(--space-md);
            }

            .user-avatar {
                width: 40px;
                height: 40px;
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            .home-container {
                padding: var(--space-md);
            }

            .search-filter-section {
                padding: var(--space-md);
                margin: 0;
            }

            .search-input {
                padding: var(--space-sm) var(--space-sm) var(--space-sm) 40px;
            }

            .search-icon {
                left: var(--space-sm);
                font-size: 16px;
            }

            .filter-section-header {
                font-size: var(--font-xs);
            }
        }

        /* Tablet Responsiveness */
        @media (min-width: 769px) and (max-width: 1024px) {
            .filter-row {
                grid-template-columns: 1fr 1fr;
                gap: var(--space-md);
            }

            .clear-filters,
            .filter-button {
                grid-column: span 2;
                width: auto;
                justify-self: center;
            }
        }
    </style>
</head>

<body>
    <!-- Enhanced Background Effects -->
    <div class="floating-particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Floating Geometric Shapes -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Main Container -->
    <div class="home-container">
        <div style="max-width: 1200px; margin: 0 auto;">

            <!-- Header Section -->
            <div class="header-section">
                <div class="welcome-info">
                    <h1><i class="fas fa-home"></i> Skill Swap Feed</h1>
                    <p>ค้นหาและแลกเปลี่ยนทักษะกับชุมชนของเรา</p>
                </div>

                <div class="user-profile">
                    <div class="user-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div>
                        <div class="user-name">${sessionScope.user.username}</div>
                        <a href="doLogout" style="font-size: 12px; color: var(--error); text-decoration: none;">
                            <i class="fas fa-sign-out-alt"></i> ออกจากระบบ
                        </a>
                    </div>
                </div>
            </div>

            <!-- Welcome Message -->
            <c:if test="${param.welcome == 'true'}">
                <div class="glass-card" style="margin-bottom: var(--space-xl); padding: var(--space-lg); background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.3); animation: slideInFromTop 0.5s ease-out;">
                    <div style="display: flex; align-items: center; gap: var(--space-sm); color: #3b82f6;">
                        <i class="fas fa-hand-wave" style="font-size: 20px;"></i>
                        <span style="font-weight: 600; font-size: var(--font-base);">ยินดีต้อนรับสู่ Skill Swap! 👋</span>
                    </div>
                    <p style="margin: var(--space-sm) 0 0 28px; color: rgba(59, 130, 246, 0.8); font-size: var(--font-sm);">
                        เข้าสู่ระบบสำเร็จแล้ว พร้อมแลกเปลี่ยนทักษะกับชุมชนของเรา
                    </p>
                </div>
            </c:if>

            <!-- Success Message -->
            <c:if test="${param.success == 'skill-created'}">
                <div class="glass-card" style="margin-bottom: var(--space-xl); padding: var(--space-lg); background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.3); animation: slideInFromTop 0.5s ease-out;">
                    <div style="display: flex; align-items: center; gap: var(--space-sm); color: var(--success);">
                        <i class="fas fa-check-circle" style="font-size: 20px;"></i>
                        <span style="font-weight: 600; font-size: var(--font-base);">สร้าง Skill Offer สำเร็จแล้ว! 🎉</span>
                    </div>
                    <p style="margin: var(--space-sm) 0 0 28px; color: rgba(16, 185, 129, 0.8); font-size: var(--font-sm);">
                        ทักษะของคุณถูกเพิ่มเข้าสู่ระบบแล้ว ผู้คนจะสามารถค้นหาและติดต่อคุณได้
                    </p>
                </div>
            </c:if>

            <!-- Ultra-Modern Search and Filter Section -->
            <div class="search-filter-section">
                <form method="GET" action="home">
                    <!-- Main Search Bar -->
                    <div class="search-bar">
                        <div class="search-input-group">
                            <input type="text"
                                   name="search"
                                   class="search-input"
                                   placeholder="ค้นหาทักษะที่สนใจ... เช่น Programming, Design, Marketing, Photography"
                                   value="${searchQuery}">
                            <i class="fas fa-search search-icon"></i>
                        </div>
                        <button type="submit" class="search-button">
                            <i class="fas fa-search"></i>
                            ค้นหา
                        </button>
                    </div>

                    <!-- Advanced Filters Section -->
                    <div class="filter-section-header">
                        <i class="fas fa-sliders-h"></i>
                        <span>ตัวกรองขั้นสูง</span>
                    </div>

                    <div class="filter-row">
                        <!-- Enhanced Premium Category Dropdown -->
                        <div class="custom-select-wrapper" id="categoryDropdown">
                            <i class="fas fa-layer-group category-icon" id="categoryIcon"></i>
                            <select name="categoryId" class="filter-select with-icon" id="categorySelect">
                                <option value="" data-icon="fas fa-th-large">📋 หมวดหมู่ทั้งหมด</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}" ${selectedCategoryId == category.id ? 'selected' : ''}>
                                        <c:choose>
                                            <c:when test="${category.categoryName == 'Programming'}">💻</c:when>
                                            <c:when test="${category.categoryName == 'Design'}">🎨</c:when>
                                            <c:when test="${category.categoryName == 'Marketing'}">📈</c:when>
                                            <c:when test="${category.categoryName == 'Photography'}">📸</c:when>
                                            <c:when test="${category.categoryName == 'Music'}">🎵</c:when>
                                            <c:when test="${category.categoryName == 'Language'}">🌍</c:when>
                                            <c:when test="${category.categoryName == 'Cooking'}">🍳</c:when>
                                            <c:when test="${category.categoryName == 'Fitness'}">💪</c:when>
                                            <c:when test="${category.categoryName == 'Writing'}">✍️</c:when>
                                            <c:when test="${category.categoryName == 'Business'}">💼</c:when>
                                            <c:otherwise>🔧</c:otherwise>
                                        </c:choose>
                                        ${category.categoryName}
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="dropdown-arrow"></div>
                        </div>

                        <!-- Location Input -->
                        <input type="text"
                               name="location"
                               class="location-input"
                               placeholder="🌍 สถานที่ เช่น กรุงเทพ, เชียงใหม่"
                               value="${selectedLocation}">

                        <!-- Clear Filters Button -->
                        <c:if test="${not empty searchQuery or not empty selectedLocation or not empty selectedCategoryId}">
                            <a href="home" class="clear-filters">
                                <i class="fas fa-times-circle"></i>
                                ล้างตัวกรอง
                            </a>
                        </c:if>

                        <!-- Filter Apply Button -->
                        <button type="submit" class="filter-button">
                            <i class="fas fa-filter"></i>
                            กรอง
                        </button>
                    </div>
                </form>
            </div>

            <!-- Feed Header -->
            <div class="feed-header">
                <h2 class="feed-title">
                    <c:choose>
                        <c:when test="${not empty searchQuery}">
                            ผลการค้นหา "${searchQuery}"
                        </c:when>
                        <c:when test="${not empty selectedLocation}">
                            ทักษะใน ${selectedLocation}
                        </c:when>
                        <c:otherwise>
                            ทักษะล่าสุด
                        </c:otherwise>
                    </c:choose>
                    <span style="font-size: var(--font-base); font-weight: normal; opacity: 0.7;">
                        (${skillOffers != null ? skillOffers.size() : 0} รายการ)
                    </span>
                </h2>

                <a href="add-skill" class="add-skill-button">
                    <i class="fas fa-plus-circle"></i>
                    แชร์ทักษะของคุณ
                </a>
            </div>

            <!-- Skill Offers Grid -->
            <c:choose>
                <c:when test="${not empty skillOffers}">
                    <div class="skill-offers-grid">
                        <c:forEach var="offer" items="${skillOffers}">
                            <div class="glass-card skill-offer-card">
                                <div class="skill-header">
                                    <span class="skill-category">
                                        <c:choose>
                                            <c:when test="${not empty offer.skill and not empty offer.skill.category}">
                                                ${offer.skill.category.categoryName}
                                            </c:when>
                                            <c:otherwise>ไม่ระบุหมวดหมู่</c:otherwise>
                                        </c:choose>
                                    </span>
                                    <span class="skill-date">
                                        <c:if test="${not empty offer.createdAt}">
                                            ${offer.createdAt.dayOfMonth}
                                            ${offer.createdAt.month.toString().substring(0,3).toLowerCase()}
                                            ${offer.createdAt.year}
                                        </c:if>
                                    </span>
                                </div>

                                <h3 class="skill-title">
                                    <c:out value="${not empty offer.title ? offer.title : 'ไม่มีชื่อ'}"/>
                                </h3>

                                <p class="skill-description">
                                    <c:out value="${not empty offer.description ? offer.description : 'ไม่มีรายละเอียด'}"/>
                                </p>

                                <div class="skill-footer">
                                    <div class="skill-user">
                                        <div class="skill-user-avatar">
                                            <c:choose>
                                                <c:when test="${not empty offer.user and not empty offer.user.username}">
                                                    ${offer.user.username.substring(0,1).toUpperCase()}
                                                </c:when>
                                                <c:otherwise>?</c:otherwise>
                                            </c:choose>
                                        </div>
                                        <span class="skill-username">
                                            <c:out value="${not empty offer.user.username ? offer.user.username : 'ไม่ระบุผู้ใช้'}"/>
                                        </span>
                                    </div>

                                    <c:if test="${not empty offer.location}">
                                        <div class="skill-location">
                                            <i class="fas fa-map-marker-alt"></i>
                                            <c:out value="${offer.location}"/>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="glass-card empty-state">
                        <i class="fas fa-search"></i>
                        <h3>ไม่พบทักษะที่ค้นหา</h3>
                        <p>ลองเปลี่ยนคำค้นหาหรือตัวกรองดู หรือ <a href="add-skill" style="color: var(--primary);">แชร์ทักษะแรกของคุณ</a></p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        // Enhanced Interactive Functionality
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-input');
            const filterSelects = document.querySelectorAll('.filter-select');
            const skillCards = document.querySelectorAll('.skill-offer-card');
            const addSkillButton = document.querySelector('.add-skill-button');

            // Initialize category icons on page load
            const categorySelect = document.getElementById('categorySelect');
            if (categorySelect) {
                setTimeout(() => {
                    updateCategoryIconEnhanced(categorySelect, false); // No animation on initial load
                }, 100);
            }

            // Enhanced dropdown interactions with premium animations
            filterSelects.forEach(select => {
                const wrapper = select.closest('.custom-select-wrapper');
                const dropdownArrow = wrapper.querySelector('.dropdown-arrow');

                // Enhanced premium dropdown interactions
                select.addEventListener('focus', function() {
                    wrapper.classList.add('dropdown-focused');
                    wrapper.style.transform = 'translateY(-4px) scale(1.02)';
                    wrapper.style.boxShadow = '0 25px 60px rgba(99, 102, 241, 0.3), 0 0 0 3px rgba(99, 102, 241, 0.4)';
                });

                select.addEventListener('blur', function() {
                    setTimeout(() => {
                        wrapper.classList.remove('dropdown-focused');
                        wrapper.style.transform = '';
                        wrapper.style.boxShadow = '';
                    }, 150);
                });

                // Enhanced mouseenter/mouseleave
                wrapper.addEventListener('mouseenter', function() {
                    if (!wrapper.classList.contains('dropdown-focused')) {
                        this.style.transform = 'translateY(-4px) scale(1.02)';
                        this.style.boxShadow = '0 20px 50px rgba(99, 102, 241, 0.25), 0 0 0 1px rgba(255, 255, 255, 0.3)';
                    }
                });

                wrapper.addEventListener('mouseleave', function() {
                    if (!wrapper.classList.contains('dropdown-focused')) {
                        this.style.transform = '';
                        this.style.boxShadow = '';
                    }
                });

                // Add hover effect for options to preview icons
                select.addEventListener('mouseover', function(e) {
                    if (e.target.tagName === 'OPTION') {
                        const optionText = e.target.textContent;
                        const previewIcon = getCategoryIcon(optionText);
                        const iconElement = wrapper.querySelector('.category-icon');

                        // Store current icon
                        if (!iconElement.dataset.originalIcon) {
                            iconElement.dataset.originalIcon = iconElement.className;
                        }

                        // Preview new icon with subtle animation
                        iconElement.className = previewIcon + ' category-icon';
                        iconElement.style.transform = 'translateY(-50%) scale(1.1)';
                        iconElement.style.filter = 'drop-shadow(0 0 8px rgba(99, 102, 241, 0.6))';
                    }
                });

                select.addEventListener('mouseout', function() {
                    const iconElement = wrapper.querySelector('.category-icon');
                    if (iconElement.dataset.originalIcon) {
                        // Restore original icon
                        iconElement.className = iconElement.dataset.originalIcon;
                        iconElement.style.transform = 'translateY(-50%) scale(1)';
                        iconElement.style.filter = 'drop-shadow(0 0 4px rgba(255, 255, 255, 0.2))';
                    }
                });

                // Auto-submit on change with enhanced feedback and animations
                select.addEventListener('change', function() {
                    // Clear the original icon data since we're changing
                    const iconElement = wrapper.querySelector('.category-icon');
                    delete iconElement.dataset.originalIcon;
                    // Add spectacular loading animation
                    const form = this.closest('form');
                    const filterSection = document.querySelector('.search-filter-section');

                    // Create loading overlay with glassmorphism
                    const loadingOverlay = document.createElement('div');
                    loadingOverlay.style.cssText = `
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background: rgba(99, 102, 241, 0.1);
                        backdrop-filter: blur(10px);
                        border-radius: var(--radius-xl);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        z-index: 1000;
                        opacity: 0;
                        transition: all 0.3s ease;
                    `;

                    const loader = document.createElement('div');
                    loader.style.cssText = `
                        width: 40px;
                        height: 40px;
                        border: 3px solid rgba(255, 255, 255, 0.3);
                        border-radius: 50%;
                        border-top: 3px solid var(--primary);
                        animation: spin 1s linear infinite;
                        box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
                    `;

                    loadingOverlay.appendChild(loader);
                    filterSection.style.position = 'relative';
                    filterSection.appendChild(loadingOverlay);

                    // Animate in loading overlay
                    setTimeout(() => {
                        loadingOverlay.style.opacity = '1';
                    }, 10);

                    // Update category icon with animation
                    if (select.id === 'categorySelect') {
                        updateCategoryIconEnhanced(this);
                    }

                    // Add enhanced delay for better UX
                    setTimeout(() => {
                        form.submit();
                    }, 500);
                });
            });

            // Get the correct icon class for a category
            function getCategoryIcon(categoryName) {
                // Complete enhanced icon mapping with modern FontAwesome icons
                const categoryIcons = {
                    // Thai text
                    'หมวดหมู่ทั้งหมด': 'fas fa-th-large',
                    'หมวดหมู่': 'fas fa-th-large',
                    'ทั้งหมด': 'fas fa-th-large',

                    // English categories
                    'Programming': 'fas fa-code',
                    'Design': 'fas fa-palette',
                    'Marketing': 'fas fa-chart-line',
                    'Photography': 'fas fa-camera',
                    'Music': 'fas fa-music',
                    'Language': 'fas fa-globe-americas',
                    'Cooking': 'fas fa-utensils',
                    'Fitness': 'fas fa-dumbbell',
                    'Writing': 'fas fa-feather-alt',
                    'Business': 'fas fa-briefcase',

                    // Additional variations and alternatives
                    'Web Development': 'fas fa-laptop-code',
                    'Mobile Development': 'fas fa-mobile-alt',
                    'Data Science': 'fas fa-chart-bar',
                    'AI': 'fas fa-robot',
                    'Graphic Design': 'fas fa-paint-brush',
                    'UI/UX': 'fas fa-pencil-ruler',
                    'Digital Marketing': 'fas fa-bullhorn',
                    'SEO': 'fas fa-search',
                    'Video': 'fas fa-video',
                    'Audio': 'fas fa-volume-up',
                    'Teaching': 'fas fa-chalkboard-teacher',
                    'Translation': 'fas fa-language',
                    'Sports': 'fas fa-running',
                    'Health': 'fas fa-heartbeat',
                    'Finance': 'fas fa-calculator',
                    'Management': 'fas fa-users-cog',

                    // Generic fallback patterns
                    'Tech': 'fas fa-microchip',
                    'Art': 'fas fa-palette',
                    'Media': 'fas fa-photo-video',
                    'Education': 'fas fa-graduation-cap',
                    'Health': 'fas fa-plus-square'
                };

                // Enhanced detection with multiple matching strategies
                let iconClass = 'fas fa-layer-group'; // default

                // Strategy 1: Exact match
                if (categoryIcons[categoryName.trim()]) {
                    iconClass = categoryIcons[categoryName.trim()];
                } else {
                    // Strategy 2: Contains match (case insensitive)
                    const lowerCategoryName = categoryName.toLowerCase();
                    let found = false;

                    Object.keys(categoryIcons).forEach(category => {
                        if (!found && lowerCategoryName.includes(category.toLowerCase())) {
                            iconClass = categoryIcons[category];
                            found = true;
                        }
                    });

                    // Strategy 3: Keyword matching
                    if (!found) {
                        if (lowerCategoryName.includes('program') || lowerCategoryName.includes('code') || lowerCategoryName.includes('dev')) {
                            iconClass = 'fas fa-code';
                        } else if (lowerCategoryName.includes('design') || lowerCategoryName.includes('art')) {
                            iconClass = 'fas fa-palette';
                        } else if (lowerCategoryName.includes('market') || lowerCategoryName.includes('sale')) {
                            iconClass = 'fas fa-chart-line';
                        } else if (lowerCategoryName.includes('photo') || lowerCategoryName.includes('camera')) {
                            iconClass = 'fas fa-camera';
                        } else if (lowerCategoryName.includes('music') || lowerCategoryName.includes('sound')) {
                            iconClass = 'fas fa-music';
                        } else if (lowerCategoryName.includes('language') || lowerCategoryName.includes('lang')) {
                            iconClass = 'fas fa-globe-americas';
                        } else if (lowerCategoryName.includes('cook') || lowerCategoryName.includes('food')) {
                            iconClass = 'fas fa-utensils';
                        } else if (lowerCategoryName.includes('fit') || lowerCategoryName.includes('sport') || lowerCategoryName.includes('exercise')) {
                            iconClass = 'fas fa-dumbbell';
                        } else if (lowerCategoryName.includes('writ') || lowerCategoryName.includes('content')) {
                            iconClass = 'fas fa-feather-alt';
                        } else if (lowerCategoryName.includes('business') || lowerCategoryName.includes('manage')) {
                            iconClass = 'fas fa-briefcase';
                        }
                    }
                }

                return iconClass;
            }

            // Enhanced category icon update with premium animations
            function updateCategoryIconEnhanced(selectElement, withAnimation = true) {
                const wrapper = selectElement.closest('.custom-select-wrapper');
                const iconElement = wrapper.querySelector('.category-icon');
                const selectedOption = selectElement.options[selectElement.selectedIndex];
                const categoryName = selectedOption.text;

                // Get the correct icon class
                const newIconClass = getCategoryIcon(categoryName);

                if (!withAnimation) {
                    // Simple update without animation for initial load
                    iconElement.className = newIconClass + ' category-icon';
                    return;
                }

                // Premium multi-stage animation with particle effects
                iconElement.style.transition = 'all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
                iconElement.style.transform = 'translateY(-50%) scale(0) rotate(-180deg)';
                iconElement.style.opacity = '0';
                iconElement.style.filter = 'blur(4px)';

                // Create sparkle effect
                createSparkleEffect(wrapper);

                setTimeout(() => {
                    iconElement.className = newIconClass + ' category-icon';
                    iconElement.style.transform = 'translateY(-50%) scale(1.3) rotate(0deg)';
                    iconElement.style.opacity = '1';
                    iconElement.style.filter = 'blur(0px) drop-shadow(0 0 12px rgba(99, 102, 241, 0.8))';
                    iconElement.style.color = 'var(--primary)';

                    setTimeout(() => {
                        iconElement.style.transform = 'translateY(-50%) scale(1.15) rotate(0deg)';
                        iconElement.style.filter = 'drop-shadow(0 0 8px rgba(99, 102, 241, 0.4))';

                        setTimeout(() => {
                            iconElement.style.transform = 'translateY(-50%) scale(1) rotate(0deg)';
                            iconElement.style.filter = 'drop-shadow(0 0 4px rgba(255, 255, 255, 0.2))';
                        }, 200);
                    }, 200);
                }, 300);
            }

            // Create enhanced sparkle particle effect for icon change
            function createSparkleEffect(wrapper) {
                const sparkleCount = 12;
                const iconElement = wrapper.querySelector('.category-icon');
                const iconRect = iconElement.getBoundingClientRect();
                const wrapperRect = wrapper.getBoundingClientRect();

                const animations = ['sparkleAnimation', 'sparkleAnimation2', 'sparkleAnimation3'];
                const colors = [
                    'linear-gradient(45deg, var(--primary), var(--accent))',
                    'linear-gradient(45deg, var(--secondary), var(--success))',
                    'linear-gradient(45deg, var(--accent), var(--warning))'
                ];

                for (let i = 0; i < sparkleCount; i++) {
                    const sparkle = document.createElement('div');
                    const animationName = animations[i % 3];
                    const color = colors[i % 3];
                    const size = Math.random() * 3 + 2; // 2-5px

                    sparkle.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        background: ${color};
                        border-radius: 50%;
                        pointer-events: none;
                        z-index: 1000;
                        left: ${iconRect.left - wrapperRect.left + iconRect.width/2}px;
                        top: ${iconRect.top - wrapperRect.top + iconRect.height/2}px;
                        transform: translate(-50%, -50%);
                        animation: ${animationName} 1s ease-out forwards;
                        animation-delay: ${i * 80}ms;
                        box-shadow: 0 0 8px rgba(99, 102, 241, 0.9);
                    `;

                    wrapper.appendChild(sparkle);

                    // Remove sparkle after animation
                    setTimeout(() => {
                        if (sparkle.parentNode) {
                            sparkle.parentNode.removeChild(sparkle);
                        }
                    }, 1200 + (i * 80));
                }
            }

            // Enhanced search input interactions with modern effects
            searchInput.addEventListener('focus', function() {
                this.parentElement.classList.add('search-focused');
                // Add glow effect
                this.style.boxShadow = '0 0 0 4px rgba(99, 102, 241, 0.2), 0 20px 40px rgba(0, 0, 0, 0.15)';
            });

            searchInput.addEventListener('blur', function() {
                this.parentElement.classList.remove('search-focused');
                setTimeout(() => {
                    if (this.value.length === 0) {
                        this.style.boxShadow = '';
                        this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                    }
                }, 150);
            });

            // Real-time search validation with visual feedback
            searchInput.addEventListener('input', function() {
                const length = this.value.length;

                if (length > 2) {
                    this.style.borderColor = 'var(--success)';
                    this.style.boxShadow = '0 0 0 3px rgba(16, 185, 129, 0.2)';
                    // Add checkmark icon
                    const existingIcon = this.parentElement.querySelector('.validation-icon');
                    if (existingIcon) existingIcon.remove();

                    const icon = document.createElement('i');
                    icon.className = 'fas fa-check-circle validation-icon';
                    icon.style.cssText = `
                        position: absolute;
                        right: 20px;
                        top: 50%;
                        transform: translateY(-50%);
                        color: var(--success);
                        z-index: 4;
                        animation: bounceIn 0.3s ease-out;
                    `;
                    this.parentElement.appendChild(icon);
                } else if (length > 0) {
                    this.style.borderColor = 'var(--warning)';
                    this.style.boxShadow = '0 0 0 3px rgba(245, 158, 11, 0.2)';
                    // Remove validation icon
                    const existingIcon = this.parentElement.querySelector('.validation-icon');
                    if (existingIcon) existingIcon.remove();
                } else {
                    this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                    this.style.boxShadow = '';
                    // Remove validation icon
                    const existingIcon = this.parentElement.querySelector('.validation-icon');
                    if (existingIcon) existingIcon.remove();
                }

                // Search suggestions simulation
                if (length > 1) {
                    setTimeout(() => this.simulateSearchSuggestions(), 300);
                }
            });

            // Simulate search suggestions
            searchInput.simulateSearchSuggestions = function() {
                // Remove existing suggestions
                const existingSuggestions = document.querySelector('.search-suggestions');
                if (existingSuggestions) {
                    existingSuggestions.remove();
                }

                if (this.value.length < 2) return;

                // Create suggestions dropdown
                const suggestions = document.createElement('div');
                suggestions.className = 'search-suggestions';
                suggestions.style.cssText = `
                    position: absolute;
                    top: 100%;
                    left: 0;
                    right: 0;
                    background: rgba(255, 255, 255, 0.95);
                    border: 1px solid rgba(255, 255, 255, 0.3);
                    border-radius: var(--radius-lg);
                    backdrop-filter: blur(20px);
                    z-index: 1000;
                    margin-top: 8px;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                    max-height: 200px;
                    overflow-y: auto;
                    animation: fadeInUp 0.3s ease-out;
                `;

                // Sample suggestions based on input
                const query = this.value.toLowerCase();
                const sampleSuggestions = [
                    'Programming', 'Web Development', 'Mobile App Development',
                    'Graphic Design', 'UI/UX Design', 'Digital Marketing',
                    'Photography', 'Video Editing', 'Music Production',
                    'Language Teaching', 'Cooking', 'Fitness Training'
                ].filter(item => item.toLowerCase().includes(query)).slice(0, 5);

                sampleSuggestions.forEach((suggestion, index) => {
                    const item = document.createElement('div');
                    item.className = 'suggestion-item';
                    item.textContent = suggestion;
                    item.style.cssText = `
                        padding: 12px 16px;
                        cursor: pointer;
                        transition: all 0.2s ease;
                        color: #333;
                        font-weight: 500;
                        border-bottom: ${index < sampleSuggestions.length - 1 ? '1px solid rgba(255, 255, 255, 0.3)' : 'none'};
                    `;

                    item.addEventListener('mouseenter', function() {
                        this.style.background = 'rgba(99, 102, 241, 0.1)';
                        this.style.color = 'var(--primary)';
                    });

                    item.addEventListener('mouseleave', function() {
                        this.style.background = 'transparent';
                        this.style.color = '#333';
                    });

                    item.addEventListener('click', () => {
                        searchInput.value = suggestion;
                        suggestions.remove();
                        searchInput.dispatchEvent(new Event('input'));
                    });

                    suggestions.appendChild(item);
                });

                if (sampleSuggestions.length > 0) {
                    this.parentElement.appendChild(suggestions);

                    // Remove suggestions when clicking outside
                    setTimeout(() => {
                        document.addEventListener('click', function removeSuggestions(e) {
                            if (!suggestions.contains(e.target) && e.target !== searchInput) {
                                suggestions.remove();
                                document.removeEventListener('click', removeSuggestions);
                            }
                        });
                    }, 100);
                }
            };

            // Enhanced card interactions
            skillCards.forEach((card, index) => {
                // Add ripple effect on click
                card.addEventListener('click', function(e) {
                    const ripple = document.createElement('div');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;

                    ripple.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        background: radial-gradient(circle, rgba(255,255,255,0.3) 0%, transparent 70%);
                        border-radius: 50%;
                        pointer-events: none;
                        animation: ripple 0.6s linear;
                        z-index: 10;
                    `;

                    this.appendChild(ripple);

                    setTimeout(() => ripple.remove(), 600);

                });

                // Add hover tilt effect
                card.addEventListener('mouseenter', function(e) {
                    const rect = this.getBoundingClientRect();
                    const centerX = rect.left + rect.width / 2;
                    const centerY = rect.top + rect.height / 2;
                    const deltaX = (e.clientX - centerX) / rect.width;
                    const deltaY = (e.clientY - centerY) / rect.height;

                    this.style.transform = `
                        translateY(-8px)
                        scale(1.02)
                        rotateX(${deltaY * 5}deg)
                        rotateY(${deltaX * 5}deg)
                    `;
                });

                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1) rotateX(0) rotateY(0)';
                });

                // Add mouse move parallax effect
                card.addEventListener('mousemove', function(e) {
                    const rect = this.getBoundingClientRect();
                    const centerX = rect.left + rect.width / 2;
                    const centerY = rect.top + rect.height / 2;
                    const deltaX = (e.clientX - centerX) / rect.width;
                    const deltaY = (e.clientY - centerY) / rect.height;

                    this.style.transform = `
                        translateY(-8px)
                        scale(1.02)
                        rotateX(${deltaY * 3}deg)
                        rotateY(${deltaX * 3}deg)
                    `;
                });
            });

            // Add smooth scroll to top functionality
            let isScrolling = false;
            window.addEventListener('scroll', function() {
                if (!isScrolling) {
                    window.requestAnimationFrame(function() {
                        const scrolled = window.pageYOffset;
                        const rate = scrolled * -0.5;

                        // Parallax effect for floating shapes
                        const shapes = document.querySelectorAll('.shape');
                        shapes.forEach((shape, index) => {
                            const speed = (index + 1) * 0.3;
                            shape.style.transform = `translateY(${rate * speed}px)`;
                        });

                        isScrolling = false;
                    });
                }
                isScrolling = true;
            });

            // Add comprehensive CSS animations
            if (!document.querySelector('#enhanced-styles')) {
                const enhancedStyles = document.createElement('style');
                enhancedStyles.id = 'enhanced-styles';
                enhancedStyles.textContent = `
                    @keyframes ripple {
                        0% {
                            transform: scale(0);
                            opacity: 1;
                        }
                        100% {
                            transform: scale(1);
                            opacity: 0;
                        }
                    }

                    @keyframes bounceIn {
                        0% {
                            transform: translateY(-50%) scale(0.3);
                            opacity: 0;
                        }
                        50% {
                            transform: translateY(-50%) scale(1.1);
                            opacity: 0.8;
                        }
                        100% {
                            transform: translateY(-50%) scale(1);
                            opacity: 1;
                        }
                    }

                    @keyframes fadeInUp {
                        0% {
                            opacity: 0;
                            transform: translateY(10px);
                        }
                        100% {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    @keyframes shimmer {
                        0% {
                            background-position: -200px 0;
                        }
                        100% {
                            background-position: calc(200px + 100%) 0;
                        }
                    }

                    .search-focused::after {
                        width: 100% !important;
                    }

                    /* Custom scrollbar for suggestions */
                    .search-suggestions::-webkit-scrollbar {
                        width: 6px;
                    }

                    .search-suggestions::-webkit-scrollbar-track {
                        background: rgba(255, 255, 255, 0.1);
                        border-radius: 3px;
                    }

                    .search-suggestions::-webkit-scrollbar-thumb {
                        background: var(--primary);
                        border-radius: 3px;
                    }

                    .search-suggestions::-webkit-scrollbar-thumb:hover {
                        background: var(--primary-hover);
                    }

                    /* Loading state for forms */
                    .form-loading {
                        opacity: 0.6;
                        pointer-events: none;
                        position: relative;
                    }

                    .form-loading::before {
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
                        animation: spin 1s ease-in-out infinite;
                        z-index: 1000;
                    }

                    @keyframes spin {
                        to {
                            transform: rotate(360deg);
                        }
                    }

                    /* Sparkle animation for category icon changes */
                    @keyframes sparkleAnimation {
                        0% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(0deg);
                        }
                        20% {
                            opacity: 1;
                            transform: translate(-50%, -50%) scale(1.2) rotate(90deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(360deg) translate(30px, 30px);
                        }
                    }

                    @keyframes sparkleAnimation2 {
                        0% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(0deg);
                        }
                        20% {
                            opacity: 1;
                            transform: translate(-50%, -50%) scale(1) rotate(180deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(360deg) translate(-25px, 35px);
                        }
                    }

                    @keyframes sparkleAnimation3 {
                        0% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(0deg);
                        }
                        20% {
                            opacity: 1;
                            transform: translate(-50%, -50%) scale(0.8) rotate(270deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(360deg) translate(20px, -30px);
                        }
                    }

                    /* Enhanced pulsing glow effect */
                    @keyframes pulseGlow {
                        0%, 100% {
                            box-shadow: 0 0 5px rgba(99, 102, 241, 0.3);
                        }
                        50% {
                            box-shadow: 0 0 20px rgba(99, 102, 241, 0.8), 0 0 30px rgba(99, 102, 241, 0.4);
                        }
                    }

                    /* Dropdown arrow rotation animation */
                    @keyframes arrowRotate {
                        from {
                            transform: translateY(-50%) rotate(0deg);
                        }
                        to {
                            transform: translateY(-50%) rotate(180deg);
                        }
                    }
                `;
                document.head.appendChild(enhancedStyles);
            }

            // Add entrance animation for all elements
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate-in');
                    }
                });
            }, observerOptions);

            // Observe all skill cards for scroll animations
            skillCards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(50px)';
                card.style.transition = 'all 0.6s ease-out';
                observer.observe(card);
            });

            // Add animate-in class styles
            const animateStyles = document.createElement('style');
            animateStyles.textContent = `
                .animate-in {
                    opacity: 1 !important;
                    transform: translateY(0) !important;
                }
            `;
            document.head.appendChild(animateStyles);

        });
    </script>
</body>
</html>