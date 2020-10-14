package study.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import study.boot.exception.ValidationException;
import study.boot.service.TestService;
import study.boot.vo.ValidationVO;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

    @Resource
    private TestService testService;

    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value="/test")
    public String test(){
        return "form";
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
        return testService.exceptionTest();
    }

    @RequestMapping(value="/test/test")
    public String testing(ModelMap model){
        List<Map> list = new ArrayList<>();
        for(int i=1; i<=10; i++){
            Map<String, Object> map = new HashMap<>();
            map.put("prod","상품_"+i);
            map.put("price", 10*i);
            list.add(map);
        }

        model.addAttribute("data",list);
        return "test/test";
    }

    @RequestMapping(value="/test/file")
    public String fileTesting(){
        return "test/file";
    }

    @RequestMapping(value="/test/file2")
    public String fileTesting2(){
        return "test/file2";
    }

    @RequestMapping(value="/test/file3")
    public String fileTesting3(){
        return "test/file3";
    }

    @RequestMapping(value="/test/sortable")
    public String excelTesting(){
        return "test/sortable";
    }

    @RequestMapping(value="/gageChart")
    public String gageChart(){
        return "test/gageChart";
    }
}
