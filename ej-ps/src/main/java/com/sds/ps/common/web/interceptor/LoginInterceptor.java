package com.sds.ps.common.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * interceptor for search login user
 * @author Heewon Jung
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {

        if (request.getSession().getAttribute("userId") == null) {
            if (request.getRequestURI().indexOf("/login.do") != -1) {
                return true;
            } else {
                response.sendRedirect("sample/login.jsp");
                return false;
            }
        } else
            return true;
    }

}
