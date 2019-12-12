package utility;
 
import java.io.IOException;
 
import javax.servlet.Filter;  // 인터페이스님까
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
public class AdminLoginCheckFilter implements Filter {
 
    public void init(FilterConfig arg0) throws ServletException {
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException {
        
        // Filter가 요청 중간에서  요청에서 가로채서 request 객체를 생설. HttpServletRequest로 다운캐스팅 한 것(요청객체)
        HttpServletRequest httpRequest = (HttpServletRequest)request;
 
        // 새로운 세션을 생성하지않고 request 객체를 통해서 현재 연결되어있는 기존의 세션을 얻어옴
        HttpSession session = httpRequest.getSession(false); 
        
        // 로그인 하지 않았다고 가정
        boolean login = false;
        
        if (session != null) { // session이 null이 아니야? 그엄 객체가 생성되어 있는가로 확인
          
            if (session.getAttribute("id") != null //로그인이 된 것
                    && session.getAttribute("grade").equals("A")) { //관리자인 것
                login = true;  // 관리자라면
            }
        }
        
        // 정상적으로 로그인이 되었다면 요청 페이지로 이동합니다.
        if (login) {
            chain.doFilter(request, response); //요청했던 그대로 요청 페이지로 보냄
        } else {
            // 로그인이 안되었다면 로그인 페이지로 이동(forward 액션 태그와 같은 기능!)
            RequestDispatcher dispatcher = 
                request.getRequestDispatcher("/member/loginForm.jsp");
            dispatcher.forward(request, response);
        }
    }
 
    public void destroy() {  //인터페이스이므로 아무것도 안해도 오버라이딩 해야 함
    }
}