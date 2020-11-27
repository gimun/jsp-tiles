package com.sample.boot.service;

import com.sample.boot.exception.ServerException;
import org.springframework.stereotype.Service;
import com.sample.boot.vo.ValidationVO;

@Service
public class MainService {

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
