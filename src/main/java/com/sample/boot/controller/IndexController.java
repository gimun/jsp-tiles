package com.sample.boot.controller;

import com.sample.boot.exception.ValidationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sample.boot.service.MainService;
import com.sample.boot.vo.ValidationVO;

import javax.annotation.Resource;
import javax.validation.Valid;

@Controller
public class IndexController {

    @Resource
    private MainService mainService;

    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/test/validation")
    @ResponseBody
    public String validationTest(@Valid ValidationVO validationVO){
        if (validationVO.getName().equals("한기문")){
            throw new ValidationException();
            //throw new ValidationException("한기문 님은 입력이 불가능합니다.", "name"); // defaultMessage, field
        }

        return validationVO.toString();
    }

    @RequestMapping(value = "/test/exception")
    @ResponseBody
    public String exceptionTest() {
        return mainService.exceptionTest();
    }
}
