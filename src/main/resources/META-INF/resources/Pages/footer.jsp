<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .footer {
        position: fixed !important;
        left: 0;
        bottom: 0;
        width: 100%;
        box-sizing: border-box;

        /* YOUR NEW DESIGN */
        background: #ffffff;
        border-top: 1px solid rgba(0,0,0,0.08);
        color: #444;
        font-family: "Segoe UI", sans-serif;
        font-size: 13px;
        z-index: 9999; /* Increased safety */

        /* Standard Padding */
        padding: 10px 20px;

        /* Layout */
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 10px;

        /* Subtle depth */
        box-shadow: 0 -1px 10px rgba(0,0,0,0.03);
    }

    .footer a {
        color: #006ce9;
        text-decoration: none;
        font-weight: 500;
    }

    .footer a:hover {
        text-decoration: underline;
    }

    /* MOBILE HANDLING & SAFETY FIX */
    @media (max-width: 600px) {
        .footer {
            flex-direction: column;
            justify-content: center;
            text-align: center;

            /* CRITICAL: The "Lift" to prevent system bar overlap */
            padding-top: 10px;
            padding-bottom: 30px !important;

            gap: 2px;
            font-size: 11.5px;
            height: auto;
        }
    }

    /* Content safety so footer doesn't overlap small pages */
    body {
        padding-bottom: 100px !important;
        margin: 0;
    }
</style>

<div class="footer">
    <span>&copy; 2025 Job Application Tracker</span>
    <span>Developed by <a href="https://www.linkedin.com/in/muhammed-umer-s" target="_blank">Muhammed Umer S</a></span>
</div>