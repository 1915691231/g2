package g2.controller.auth;

import g2.util.properties.SessionProperties;
import g2.util.properties.UserProperties;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor implements HandlerInterceptor {
    private Boolean debug = true;

/*    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (debug) return true;
        UserSession session = new UserSession(request);
        try {
            if (session.getState() && !session.getName().isEmpty() && session.getType() != UserProperties.unAuth)
                return true;
        } catch (Exception e) {
            return false;
        }
        return false;
    }*/
}
