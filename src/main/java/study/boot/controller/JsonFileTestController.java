package study.boot.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class JsonFileTestController {

    @GetMapping(value = "/json/reader")
    @ResponseBody
    public String getJsonFile() {

        ClassPathResource resource = new ClassPathResource("test/test.json");
        StringBuffer rstStr = new StringBuffer();
        try {
            Path path = Paths.get(resource.getURI());
            List<String> content = Files.readAllLines(path);
            content.forEach(str-> {
                rstStr.append(str);
            });
        } catch (IOException e) {

        }

        return rstStr.toString();
    }


}
