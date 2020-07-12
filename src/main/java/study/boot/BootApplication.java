package study.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.context.annotation.Bean;
import org.springframework.web.context.request.WebRequest;
import study.boot.exception.ServerException;
import study.boot.exception.ValidationException;

import java.util.Map;

@SpringBootApplication
public class BootApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootApplication.class, args);
    }

    @Bean
    public ErrorAttributes errorAttributes() {
        return new DefaultErrorAttributes() {

            @Override
            public Map<String, Object> getErrorAttributes(WebRequest webRequest, boolean includeStackTrace) {
                Map<String, Object> errorAttributes = super.getErrorAttributes(webRequest, includeStackTrace);
                Throwable error = getError(webRequest);

                // validatijon Exception에 경우 별도의 처리를 진행한 에러 데이터 추가
                if (error instanceof ValidationException) {
                    errorAttributes.put("errors", ((ValidationException) error).getErrors());
                } else if(error instanceof ServerException){
                    errorAttributes.put("errors", ((ServerException) error).getErrors());
                }
                return errorAttributes;
            }
        };
    }


}

