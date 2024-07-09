package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;  // Giả sử Account là lớp chứa thông tin tài khoản của bạn

@WebFilter(filterName = "DinerFilter", urlPatterns = {"/*"})
public class DinerFilter implements Filter {

    private FilterConfig filterConfig = null;

    public DinerFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        // Code để xử lý trước khi request đi qua filter
    }    

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        // Code để xử lý sau khi request đi qua filter
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        Account account = (session != null) ? (Account) session.getAttribute("account") : null;

        
        if (account != null && "DinerManager".equalsIgnoreCase(account.getRole())) {
            String path = httpRequest.getServletPath();

            
            if (path.equals("/CustomerDinerPage") || path.equals("/CustomerOrderPage")) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/DinerPage");
                return;
            }
        }

        // Tiếp tục chuỗi filter
        chain.doFilter(request, response);
    }

    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
    }

    public void destroy() {        
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("DinerFilter()");
        }
        StringBuffer sb = new StringBuffer("DinerFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n");

                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>");
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
}
