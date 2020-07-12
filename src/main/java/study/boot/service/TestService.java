package study.boot.service;

import org.springframework.stereotype.Service;
import study.boot.exception.ServerException;
import study.boot.vo.ValidationVO;

@Service
public class TestService{

    public String exceptionTest() {
        ValidationVO validationVO = null;
        try {
            System.out.println(validationVO.getName());
        } catch (Exception e){
            throw new ServerException("Internal Server Error", "exceptionTest");
        }
        return "success";
    }

}
