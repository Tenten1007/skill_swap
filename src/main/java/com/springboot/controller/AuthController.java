package com.springboot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.User;
import com.springboot.model.PasswordUtil;
import com.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    private static final Logger log = LoggerFactory.getLogger(AuthController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView openLoginPage() {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage() {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public ModelAndView userLogin(HttpServletRequest request, HttpSession session) {
        String uname = request.getParameter("username");
        String pwd = request.getParameter("password");

        try {
            String hashedPassword = PasswordUtil.getInstance().createPassword(pwd, "Tenten");
            User user = new User(uname, hashedPassword);
            boolean isLogin = userService.isLogin(user);

            if (isLogin) {
                // Get complete user data from database for session
                User completeUser = userService.getUserByUsernameForManager(uname);

                // Store both username and user object for redundancy
                session.setAttribute("username", uname);
                session.setAttribute("user", completeUser != null ? completeUser : user);
                session.setMaxInactiveInterval(30 * 60); // 30 minutes

                return new ModelAndView("redirect:/home?welcome=true");
            }
        } catch (Exception e) {
            log.error("Error during login: {}", e.getMessage(), e);
        }

        ModelAndView mav = new ModelAndView("login");
        mav.addObject("error", "Login บ่สำเร็จเจ้า");
        return mav;
    }

    @RequestMapping(value = "/doLogout", method = RequestMethod.GET)
    public String doLogout(HttpSession session) {
        session.removeAttribute("user");
        session.removeAttribute("username");
        session.invalidate(); // Clear entire session
        return "redirect:/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage(HttpServletRequest request) {
        return "register";
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    public ModelAndView registerUser(HttpServletRequest request) {
        String uname = request.getParameter("username");
        String pwd = request.getParameter("password");

        User user0 = userService.getUserByUsernameForManager(uname);

        if (user0 == null) {
            try {
                String hashedPassword = PasswordUtil.getInstance().createPassword(pwd, "Tenten");
                User user = new User(uname, hashedPassword);
                userService.insertUser(user);
            } catch (Exception ex) {
                log.error("Error during user registration: {}", ex.getMessage(), ex);
            }
        } else {
            ModelAndView mav = new ModelAndView("register");
            mav.addObject("error", "username ซ้ำครับอ้าย");
            return mav;
        }

        ModelAndView mav = new ModelAndView("login");
        return mav;
    }
}