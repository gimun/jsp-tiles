package study.boot.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.File;

@Data
public class FormTest {
    @NotBlank
    private String name;
    @NotBlank
    private int year;
    private String coffee;
    private File uploadFile;
    private String memo;

}
