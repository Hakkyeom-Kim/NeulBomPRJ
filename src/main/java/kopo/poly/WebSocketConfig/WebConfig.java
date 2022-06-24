package kopo.poly.WebSocketConfig;

import kopo.poly.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 로그인 체크를 해야하는 URL에 대해 정의
        String[] loginCheckURI = {"/","/Book/BookList","/Book/Result1","/Book/Mag2","/Chat/room","/Chat/rooms","/cus", "/deleteUser", "/user/idCheck"};
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns(Arrays.asList(loginCheckURI));

    }
}