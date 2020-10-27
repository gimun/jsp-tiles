package study.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DataTableController {

    @GetMapping(value = "/dataTable/index")
    public String dataTableIndx() {
        return "dataTable/index";
    }

    @PostMapping(value = "/table/list")
    @ResponseBody
    public Map getTblData() {
        Map rstMap = new HashMap();

        List testList = new ArrayList<>();
        for(int i=0; i<12; i++){
            Map testMap = new HashMap();
            testMap.put("name", "한기문_"+i);
            testMap.put("year", 10+ i);
            testList.add(testMap);
        }

        rstMap.put("data", testList);
        return rstMap;
    }
}
