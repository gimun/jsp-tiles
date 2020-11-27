package com.sample.boot.vo;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

import javax.validation.constraints.*;

@Data
public class ValidationVO {

    @NotBlank(message = "이름은 필수 입력 값입니다.")
    private String name;

    @Positive(message = "가격은 숫자만 입력 가능하며, 필수 입력 값입니다.")
    @Min(value = 1000, message = "가격은 1,000 원 이상 입력해주세요.")
    @Setter(AccessLevel.NONE)
    private int price;

    @NotBlank
    @Email(regexp = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$")
    private String email;

    @NotBlank
    @Size(min = 11, max = 13, message = "전화번호는 11~13자 사이로 입력해주세요.")
    private String phone;

    @NotBlank
    @Size(min = 8)
    private String startDt;

//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd", timezone = "Asia/Seoul")
//    @JsonFormat(pattern = "yyyy.MM.dd")
//    private LocalDate birthDay;

//    @DateTimeFormat(pattern = "yyyy.MM.dd")
//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd", timezone = "Asia/Seoul")
//    private LocalDateTime regDt;


/****************************************************************
 (*필수) : 필수 입력 체크
 설명 : 검증할 Controller의 VO 앞에 @Valid 어노테이션 선언
 ex) @Valid ValidationVO validationVO
 ****************************************************************/


/****************************************************************
    기타 검사
 ****************************************************************
 * @NotNull           // null 비허용 (*필수)
 * @Pattern           // 정규식 검사
 * @Email             // email 형식 검사 (기본 제공)
 * @AssertTrue        // 직접 검증
 * @AssertFalse
 ****************************************************************/


/****************************************************************
    문자열 검사
 ****************************************************************
 * @NotBlank           // {null, "", " "} 비허용 (*필수)
 * @Size (min=,max=)   // 문자 길이 검사

 ****************************************************************/


/****************************************************************
    숫자 검사
 ****************************************************************
 * @Positive           // 양수만 허용 (*필수)
 * @PositiveOrZero     // 양수, 0 허용 (*필수)
 * @Negative           // 음수만 허용 (*필수)
 * @NegativeOrZero     // 음수, 0 허용 (*필수)
 * @Digits             // 정수 허용 자리수, 소수점 허용 자리수
 *
 * @Min                // 정수 최소값 지정
 * @Max                // 정수 최대값 지정
 ****************************************************************/

}
